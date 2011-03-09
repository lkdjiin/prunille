# -*- encoding: utf-8 -*-
require './spec/helper'


describe Lexer do

  before :each do
    @lexer = Lexer.new(SymbolTable.new)
  end
  
  it "must raise error if there is a leading space" do
    lambda{@lexer.parse(' Object')}.should raise_error(LexerParseError)
  end
  
  it "must raise error if there is some leading spaces" do
    lambda{@lexer.parse('    Object')}.should raise_error(LexerParseError)
  end
  
  it "must raise error if code line is empty" do
    lambda{@lexer.parse('')}.should raise_error(LexerParseError)
  end
  
  it "must parse a classname" do
    @lexer.parse('Object').should == [[:class, :Object]]
  end
  
  it "must parse a composed classname" do
    @lexer.parse('Foo-Bar').should == [[:class, :"Foo-Bar"]]
  end
  
  it "must parse a classname with numbers in it" do
    @lexer.parse('Boeing747').should == [[:class, :"Boeing747"]]
  end
  
  it "must parse an identifier" do
    @lexer.parse('object').should == [[:identifier, :object]]
  end
  
  it "must parse a composed identifier" do
    @lexer.parse('foo-bar').should == [[:identifier, :"foo-bar"]]
  end
  
  it "must parse an identifier with numbers in it" do
    @lexer.parse('boeing747').should == [[:identifier, :"boeing747"]]
  end
  
  it "must parse an integer" do
    @lexer.parse('123').should == [[:integer, 123]]
  end
  
  it "must parse the 'new' keyword" do
    @lexer.parse('new').should == [[:keyword, :new]]
  end
  
  it "must parse the 'is' keyword" do
    @lexer.parse('is').should == [[:keyword, :is]]
  end
  
  it "must parse an instanciation" do
    @lexer.parse('new Object').should == [[:keyword, :new], [:class, :Object]]
  end

end
