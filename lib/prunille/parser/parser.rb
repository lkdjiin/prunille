# -*- encoding: utf-8 -*-
module Prunille

  # I perform all the necessary steps, from a line of source code,
  # to produce an input usable by the stack machine.
  class Parser
  
    def initialize symbol_table
      @lexer = Lexer.new(symbol_table)
      @syntaxer = Syntaxer.new
      @postfixer = Postfixer.new
    end
    
    def parse a_line_of_code
      lexicals = @lexer.parse a_line_of_code
      syntactics = @syntaxer.parse lexicals
      @postfixer.postfix syntactics
    end
    
  end

end
