# -*- encoding: utf-8 -*-

module Prunille::Parser

  # I parse the Prunille language.
  class Parser
    
    def initialize
      @parser = PrunilleParser.new
    end
    
    def parse data 
      tree = @parser.parse data
      raise ::Prunille::ParseError, @parser.failure_reason unless tree
      tree.to_array
    end
    
  end

end
