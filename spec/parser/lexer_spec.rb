# -*- encoding: utf-8 -*-
require './spec/helper'


describe Lexer do

  before :each do
    @lexer = Lexer.new
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

end
