# -*- encoding: utf-8 -*-
module Prunille

  # I am a container for a syntactic unit.
  class SyntacticUnit
  
    attr_reader :type, :value
    
    def initialize lexical_unit
      if lexical_unit.nil?
        @type = @value = nil
      else
        @type = lexical_unit[0]
        @value = lexical_unit[1]
      end
    end
    
    def to_array
      if @type.nil?
        nil
      else
        [@type, @value]
      end
    end
    
    def nil?
      @type.nil?
    end
    
    def add_operator?
      operator? ['+', '-']
    end
    
    def mult_operator?
      operator? ['*', '÷', '%']
    end
    
    private
    
    def operator? values
      return false if nil?
      @type == :sign and values.include?(@value)
    end
    
  end
  
end
