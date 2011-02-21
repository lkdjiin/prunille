# -*- encoding: utf-8 -*-
require './lib/prunille'

describe Prunille::Reader::PrunilleFileReader do

  it "must return a list of lines" do
    file = 'spec/source/temp1.prunille'
    list = Prunille::Reader::PrunilleFileReader.read file
    list[0].should == '1 + 2'
    list[1].should == '3 + 4'
  end
  
end
