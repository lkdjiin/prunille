# -*- encoding: utf-8 -*-
module Prunille

  # I postfix a list of syntactic units to ease the use of a stack machine.
  class Postfixer
  
    def postfix syntactic_units
      initialize_parsing syntactic_units
      term
      until @current.nil?
        term_loop
      end
      @parsing_result
    end
    
    private
    
    def initialize_parsing syntactic_units
      @parsing_result = []
      @units = syntactic_units
      @current = SyntacticUnit.new @units.shift
    end
    
    def term
      factor
    end
    
    def term_loop
      if @current.add_operator?
        unit = @current
        accept
        term
        @parsing_result << unit.to_array
      end
    end
    
    def factor
      case @current.type
        when :integer then integer
      end
    end
    
    def integer
      @parsing_result <<  @current.to_array
      accept
    end
    
    def accept
      @current = SyntacticUnit.new @units.shift
    end
    
  end

end
