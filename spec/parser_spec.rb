# -*- encoding: utf-8 -*-
require './spec/helper'

describe Prunille::Parser::Parser do

  before :all do
    @parser = Prunille::Parser::Parser.new
  end

  it "should raise a ParseError on invalid input" do
    lambda {@parser.parse 'éléphant'}.should raise_error(::Prunille::ParseError)
  end
  
  it "should parse a simple identifier" do
    result = @parser.parse 'azerty'
    result.should == [[:spaces, 0], [:identifier, :azerty]]
  end
  
  it "should parse an identifier with -" do
    result = @parser.parse 'a-class'
    result.should == [[:spaces, 0], [:identifier, :'a-class']]
  end
  
  it "should parse an identifier with numbers" do
    result = @parser.parse 'boeing707'
    result.should == [[:spaces, 0], [:identifier, :'boeing707']]
  end
  
  it "should parse a simple class name" do
    result = @parser.parse 'Foo'
    result.should == [[:spaces, 0], [:class, :Foo]]
  end
  
  it "should parse a composed class name" do
    result = @parser.parse 'FooBarBaz'
    result.should == [[:spaces, 0], [:class, :FooBarBaz]]
  end
  
  it "should parse a composed class name with numbers" do
    result = @parser.parse 'A1b2c3D'
    result.should == [[:spaces, 0], [:class, :"A1b2c3D"]]
  end
  
  it "should parse a single text between double quotes" do
    result = @parser.parse '"azerty"'
    result.should == [[:spaces, 0], [:text, "azerty"]]
  end
  
  it "should return the number of spaces" do
    result = @parser.parse '  '
    result.should == [[:spaces, 2]]
  end
  
  it "should parse utf-8 text" do
    result = @parser.parse '"éç$£àöô"'
    result.should == [[:spaces, 0], [:text, "éç$£àöô"]]
  end
  
  it "should differentiate class keyword and classroom identifier" do
    result = @parser.parse 'classroom'
    result.should == [[:spaces, 0], [:identifier, :classroom]]
  end
  
  it "should differentiate is keyword and ist identifier" do
    result = @parser.parse 'ist'
    result.should == [[:spaces, 0], [:identifier, :ist]]
  end
  
  it "should differentiate new keyword and new-york identifier" do
    result = @parser.parse 'new-york'
    result.should == [[:spaces, 0], [:identifier, :"new-york"]]
  end
  
  it "should parse a single integer" do
    result = @parser.parse '1'
    result.should == [[:spaces, 0], [:integer, 1]]
  end
  
  it "should parse an integer addition" do
    result = @parser.parse '1 + 2'
    result.should ==  [
                        [:spaces, 0], 
                        [:operation, 
                          [[:integer, 1], [:operator, :add], [:integer, 2]]
                        ]
                      ]
  end
  
  it "should parse an instanciation" do
    result = @parser.parse 'new Object'
    result.should ==  [
                        [:spaces, 0], 
                        [:instanciation,
                          [[:keyword, :new], [:class, :Object]]
                        ]
                      ]
  end
  
  it "should parse an assignment" do
    result = @parser.parse 'obj is new Object'
    result.should ==  [
                        [:spaces, 0], 
                        [:assignment, 
                          [
                            [:identifier, :obj], 
                            [:keyword, :is], 
                            [:instanciation, 
                              [[:keyword, :new], [:class, :Object]]
                            ]
                          ]
                        ]
                      ]
  end
  
end
