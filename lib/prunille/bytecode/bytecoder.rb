# -*- encoding: utf-8 -*-
module Prunille

  # Raised if an error occured during the bytecode transformation.
  class BytecoderError < StandardError
  end
  
  # I produce bytecode from the Postfixer output.
  class Bytecoder
  
    def generate units
      @instructions = []
      units.each do |type, value|
        case type
          when :integer then gen_push value
          when :sign then gen_sign value
          else
            raise BytecoderError, "Unknown type: #{type}"
        end
      end
      @instructions
    end
    
    private
    
    def gen_push value
      @instructions << [:push, value]
    end
    
    def gen_sign value
      case value
        when '+' then @instructions << [:add]
        when '-' then @instructions << [:sub]
        when '*' then @instructions << [:mul]
        when '÷' then @instructions << [:div]
        when '%' then @instructions << [:mod]
      end
    end
    
  end
  
end
