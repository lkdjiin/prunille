# -*- encoding: utf-8 -*-

module Prunille

  # I parse the Prunille language.
  class Parser
    
    def initialize
      @parser = PrunilleParser.new
    end
    
    def parse data 
      tree = @parser.parse data
      raise ParseError, @parser.failure_reason unless tree
      tree.to_array
    end
    
  end

end
