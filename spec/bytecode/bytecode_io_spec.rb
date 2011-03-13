# -*- encoding: utf-8 -*-
require './spec/helper'


describe BytecodeIO do

  before :all do
    @filename = File.join('spec/source', 'filename')
    @filename_pc = @filename + '.pc'
  end

  after :each do
    FileUtils.remove_file(@filename_pc) if File.file?(@filename_pc)
  end
  
  def dump
    bytecode = [[:push, 1], [:push, 2], [:add]]
    BytecodeIO.dump(bytecode, @filename)
  end
  
  it "must dump bytecode" do
    dump
    File.exist?(@filename_pc).should be_true
  end
  
  it "must load bytecode" do
    dump
    bytecode = BytecodeIO.load(@filename)
    bytecode.should == [[:push, 1], [:push, 2], [:add]]
  end
  
end
