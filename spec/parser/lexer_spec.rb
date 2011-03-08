# -*- encoding: utf-8 -*-
require './spec/helper'

describe Lexer do

  before :each do
    @lexer = Lexer.new
  end

  it "must parse a classname" do
    @lexer.parse('Object').should == [[:indent, 0], [:class, :Object]]
  end

end
