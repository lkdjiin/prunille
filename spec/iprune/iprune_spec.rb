# -*- encoding: utf-8 -*-
require './spec/helper'
require './lib/prunille/iprune'

describe IPrune do

  before :all do
    @iprune = IPrune.new
  end
  
  it "must resolve an addition" do
    result, error = @iprune.eval_expression('123+7')
    error.should be_false
    result.should == 130
  end
  
  it "must resolve a substraction" do
    result, error = @iprune.eval_expression('123-3')
    error.should be_false
    result.should == 120
  end
  
  it "must return nil on empty expression" do
    @iprune.eval_expression('').should == nil
  end
  
  it "must prompt with line number" do
    iprune = IPrune.new
    iprune.prompt.should == "iprune:001> "
    iprune.prompt.should == "iprune:002> "
  end
  
  it "must return error message on unexpected token" do
    result, error = @iprune.eval_expression('1 + $')
    error.should be_true
    result.should == "Prunille::LexerParseError\n   Unexpected token <$>"
  end
  
  it "must return error message on unexpected unit" do
    result, error = @iprune.eval_expression('1p2')
    error.should be_true
    result.should == "Prunille::SyntaxError\n   Expected one of +, -"
  end
  
  it "must return error message on incomphrensible expression" do
    result, error = @iprune.eval_expression('+')
    error.should be_true
    result.should == "Prunille::SyntaxError\n   Expected one of Integer"
  end

end
