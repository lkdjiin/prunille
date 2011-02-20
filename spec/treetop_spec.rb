# -*- encoding: utf-8 -*-
require './lib/prunille'

describe Treetop do

  it "should return nil on invalid input" do
    tree = PrunilleParser.new.parse 'éléphant'
    tree.should == nil
  end
  
end
