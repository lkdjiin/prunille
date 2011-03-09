# -*- encoding: utf-8 -*-

module Prunille

  # Remember all the symbols of a script.
  class SymbolTable < Hash
    
    def initialize
      self[:new] = Keyword
    end
    
  end
  
end
