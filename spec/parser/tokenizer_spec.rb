# -*- encoding: utf-8 -*-
require './spec/helper'


describe Tokenizer do

  it "must produce tokens" do
    tokenizer = Tokenizer.new "new Object"
    tokenizer.has_more_token?.should == true
    2.times {tokenizer.next_token}
    tokenizer.has_more_token?.should == false
  end
  
  it "must produce name-like token" do
    tokenizer = Tokenizer.new "a-thing A-Thing"
    tokenizer.next_token.should == "a-thing"
    tokenizer.next_token.should == "A-Thing"
  end
  
  it "must produce integer-like token" do
    tokenizer = Tokenizer.new "1234"
    tokenizer.next_token.should == 1234
  end
  
  it "must produce sign token" do
    tokenizer = Tokenizer.new "+"
    tokenizer.next_token.should == "+"
    tokenizer = Tokenizer.new "÷"
    tokenizer.next_token.should == "÷"
  end
  
  # Bug appeared during devel. A one char token can be delivered but
  # Tokenizer says that it doesnt have got it.
  it "must produce a one char token" do
    tokenizer = Tokenizer.new "a"
    tokenizer.next_token.should == "a"
    
    tokenizer = Tokenizer.new "a"
    # Bug is has_more_token? == false
    tokenizer.has_more_token?.should == true
  end
  
end
