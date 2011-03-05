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
  
  it "can inherit from a single parent" do
    parent = PrunilleObject.new
    child = PrunilleObject.new
    child.inherit(parent)
  end
  
  it "must retain its single parent" do
    parent = PrunilleObject.new
    child = PrunilleObject.new
    child.inherit(parent)
    child[:parents].should == [parent]
  end
  
  it "can inherit from some parents" do
    child = PrunilleObject.new
    child.inherit(PrunilleObject.new)
    child.inherit(PrunilleObject.new)
  end
  
  it "must retain all its parents in order" do
    parent1 = PrunilleObject.new
    parent2 = PrunilleObject.new
    child = PrunilleObject.new
    child.inherit(parent1)
    child.inherit(parent2)
    child[:parents].should == [parent1, parent2]
  end
  
  it "must not accept a non PrunilleObject" do
    child = PrunilleObject.new
    lambda {child.inherit('azerty')}.should raise_error(ArgumentError)
  end

end
