# -*- encoding: utf-8 -*-
require './spec/helper'

describe Prunille::Main do

  it "take an argument on creation" do
    lambda {Prunille::Main.new}.should raise_error(ArgumentError)
  end
  
  it "must take a prunille source file on creation" do
    lambda {Prunille::Main.new 'source.c'}.should raise_error(ArgumentError)
  end
  
  it "must take an existing prunille source file on creation" do
    lambda {Prunille::Main.new 'unknown.prunille'}.should raise_error(ArgumentError)
  end
  
  it "must not raise anything on a valid argument" do
    lambda {Prunille::Main.new 'spec/source/void.prunille'}.should_not raise_error
  end
  
  it "must not raise anything when processing a valid source" do
    main = Prunille::Main.new 'spec/source/temp1.prunille'
    lambda {main.process}.should_not raise_error
  end
  
end
