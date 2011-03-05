# -*- encoding: utf-8 -*-
require './spec/helper'

include Prunille::ObjectMechanic

describe Prunille::ObjectMechanic::PrunilleObject do

  it "must have empty slots on creation" do
    PrunilleObject.new[:slots].should == {}
  end
  
  it "must have no parents on creation" do
    PrunilleObject.new[:parents].should == []
  end
  
  it "can be constructed from a single parent" do
    parent = PrunilleObject.new
    child = PrunilleObject.new(parent)
  end
  
  it "must retain its single parent" do
    parent = PrunilleObject.new
    PrunilleObject.new(parent)[:parents].should == [parent]
  end
  
  it "can be constructed from some parents" do
    parent1 = PrunilleObject.new
    parent2 = PrunilleObject.new
    child = PrunilleObject.new(parent1, parent2)
  end
  
  it "must retain all its parents in order" do
    parent1 = PrunilleObject.new
    parent2 = PrunilleObject.new
    PrunilleObject.new(parent1, parent2)[:parents].should == [parent1, parent2]
  end
  
  it "must not accept a non PrunilleObject" do
    parent1 = PrunilleObject.new
    parent2 = 'azerty'
    lambda {PrunilleObject.new(parent1, parent2)}.should raise_error(ArgumentError)
  end

end
