# -*- encoding: utf-8 -*-
require './spec/helper'
require './lib/prunille/iprune'

describe IPrune do

  before :all do
    @iprune = IPrune.new
  end
  
  it "must resolve an addition" do
    @iprune.eval_expression('123+7').should == 130
  end
  
  it "must resolve a substraction" do
    @iprune.eval_expression('123-3').should == 120
  end
  
  it "must return nil on empty expression" do
    @iprune.eval_expression('').should == nil
  end
  
  it "must prompt with line number" do
    iprune = IPrune.new
    iprune.prompt.should == "iprune:001> "
    iprune.prompt.should == "iprune:002> "
  end
  
  it "must return message on error" do
    @iprune.eval_expression('1 + $').should == "Prunille::LexerParseError\n   Unexpected token <$>"
    @iprune.eval_expression('+').should == "Prunille::SyntaxError\n   Expected one of Integer"
    @iprune.eval_expression('1p2').should == "Prunille::SyntaxError\n   Expected one of +, -"
  end

end
