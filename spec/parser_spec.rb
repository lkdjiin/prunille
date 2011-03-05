# -*- encoding: utf-8 -*-
require './spec/helper'

describe Prunille::Parser::Parser do

  before :all do
    @parser = Prunille::Parser::Parser.new
  end

  it "should raise a ParseError on invalid input" do
    lambda {@parser.parse 'éléphant'}.should raise_error(::Prunille::ParseError)
  end
  
  it "should parse a single identifier" do
    result = @parser.parse 'azerty'
    result.should == [[:spaces, 0], [:identifier, :azerty]]
  end
  
  it "should parse an identifier with -" do
    result = @parser.parse 'a-class'
    result.should == [[:spaces, 0], [:identifier, :'a-class']]
  end
  
  it "should parse an identifier with numbers" do
    result = @parser.parse 'boeing-707'
    result.should == [[:spaces, 0], [:identifier, :'boeing-707']]
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
  
  #~ it "should parse keyword class" do
    #~ result = @parser.parse 'class'
    #~ result.should == [[:keyword, :class]]
  #~ end
  #~ 
  it "should differentiate class keyword and classroom identifier" do
    result = @parser.parse 'classroom'
    result.should == [[:spaces, 0], [:identifier, :classroom]]
  end
  
  #~ it "should parse keyword is" do
    #~ result = @parser.parse 'is'
    #~ result.should == [[:keyword, :is]]
  #~ end
  
  it "should differentiate is keyword and ist identifier" do
    result = @parser.parse 'ist'
    result.should == [[:spaces, 0], [:identifier, :ist]]
  end
  
  #~ it "should parse keyword new" do
    #~ result = @parser.parse 'new'
    #~ result.should == [[:keyword, :new]]
  #~ end
  
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
    result.should == [ [:spaces, 0], 
                       [:operation, [[:integer, 1], [:operator, :add], [:integer, 2]]]
                     ]
  end
  
end
