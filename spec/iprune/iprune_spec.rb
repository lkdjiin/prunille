# -*- encoding: utf-8 -*-
require './spec/helper'
require './lib/prunille/iprune'

describe IPrune do

  before :all do
    @iprune = IPrune.new
  end
  
  it "must resolve an addition" do
    @iprune.eval_expression('123+7').should == 130
  end
  
  it "must resolve a substraction" do
    @iprune.eval_expression('123-3').should == 120
  end
  
  it "must prompt with line number" do
    iprune = IPrune.new
    def iprune.public_prompt
      prompt
    end
    iprune.public_prompt.should == "iprune:001> "
    iprune.public_prompt.should == "iprune:002> "
  end

end
