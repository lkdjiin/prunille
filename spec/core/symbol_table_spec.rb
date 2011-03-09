# -*- encoding: utf-8 -*-
require './spec/helper'

describe SymbolTable do

  before :each do
    @sym_tab = SymbolTable.new
  end
  
  it "must know 'new' keyword" do
      @sym_tab['new'].nil?.should == false
  end
  
  it "must tell 'new' is of type Keyword" do
    @sym_tab['new'].should == Keyword
  end
  
end
