# -*- encoding: utf-8 -*-

module Prunille

  class SymbolTable < Hash
    
    def initialize
      self[:new] = Keyword
    end
    
  end
  
end
