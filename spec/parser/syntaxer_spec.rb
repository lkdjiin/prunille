# -*- encoding: utf-8 -*-
require './spec/helper'


describe Syntaxer do

  before :all do
    @syntaxer = Syntaxer.new
  end
  
  it "must parse a single integer" do
    result = @syntaxer.parse([[:integer, 1]])
    result.should == [[:integer, 1]]
  end

  it "must parse a simple addition" do
    result = @syntaxer.parse([[:integer, 1], [:sign, '+'], [:integer, 2]])
    result.should == [[:integer, 1], [:sign, '+'], [:integer, 2]]
  end
  
  it "must raise an error on bad syntax" do
    lambda{@syntaxer.parse([[:integer, 1], [:integer, 2]])}.should raise_error(Prunille::SyntaxError)
  end
  
  it "must tell about error occured" do
    begin
      @syntaxer.parse([[:integer, 1], [:integer, 2]])
    rescue Prunille::SyntaxError => ex
      ex.message.should == "Expected one of +, -"
    end
  end

end
