# -*- encoding: utf-8 -*-
module Prunille
  
  # Raised on a syntax error
  class SyntaxError < StandardError
  end
  
  # I transform a list of lexical units in a list of
  # syntactic units. In other words, I validate the grammar.
  class Syntaxer
  
    def parse lexical_units
      initialize_parsing lexical_units
      term
      parse_loop
      @parsing
    end
    
    private
    
    def parse_loop
      until @current.nil?
        sign
        term
      end
    end
    
    def initialize_parsing lexical_units
      @parsing = []
      @units = lexical_units
      @current = SyntacticUnit.new @units.shift
    end
    
    def term
      factor
    end
    
    def factor
      case @current.type
        when :integer then integer
        else
          raise RuntimeError, "Error, I need an expression"
      end
    end
    
    def integer
      @parsing <<  @current.to_array
      accept :integer
    end
    
    def sign
      unit = @current.to_array
      if [[:sign, '+'], [:sign, '-']].include?(unit)
        @parsing <<  unit
        accept @current.type
      else
        raise SyntaxError, "Expected one of +, -"
      end
    end
    
    def accept type
      if @current.type == type
        @current = SyntacticUnit.new @units.shift
      else
        raise RuntimeError, "Internal error"
      end
    end
    
  end

end
