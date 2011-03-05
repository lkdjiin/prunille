# -*- encoding: utf-8 -*-

# Main namespace for the Prunille language.
module Prunille
module Parser

  # Common methods for the Parser module
  class ParserHelper
    def ParserHelper.elements_to_array syntax_node
      ret = syntax_node.elements.map {|elem| elem.to_array if elem.respond_to?(:to_array)}
      ret.delete nil
      ret
    end
  end
  
  # A terminal node of the grammar, that define
  # a to_array method for its representation.
  # Note that some terminals (see TextLiteral)
  # doesn't inherit from me.
  class PrunilleTerminal < Treetop::Runtime::SyntaxNode
    def initialize(name, repr_method, *args)
      super(*args)
      @my_symbol = name
      @my_representation_method = repr_method
    end
    
    def to_array
      [@my_symbol, self.text_value.send(@my_representation_method)]
    end
  end
  
  # A single statement of the language
  class Statement < Treetop::Runtime::SyntaxNode
    def to_array
      ParserHelper.elements_to_array self
    end
  end
  
  # An operation, in the sense of the language
  class Operation  < Treetop::Runtime::SyntaxNode
    def to_array
      [:operation, ParserHelper.elements_to_array(self)]
    end
  end

  # A text terminal
  class TextLiteral < Treetop::Runtime::SyntaxNode
    def to_array
      [:text, self.text_value[1..-2]]
    end
  end
  
  # Keywords of the language
  class Keyword < PrunilleTerminal
    def initialize(*args)
      super(:keyword, :to_sym, *args)
    end
  end

  # An identifier terminal
  class Identifier < PrunilleTerminal
    def initialize(*args)
      super(:identifier, :to_sym, *args)
    end
  end
  
  # An integer terminal
  class IntegerLiteral < PrunilleTerminal
    def initialize(*args)
      super(:integer, :to_i, *args)
    end
  end

  # A terminal that is a sequence of leading spaces
  class Spaces < PrunilleTerminal
    def initialize(*args)
      super(:spaces, :size, *args)
    end
  end
  
  # A operator, in the sense of the language
  class Operator < Treetop::Runtime::SyntaxNode
    def to_array
      [:operator, :add] if self.text_value == '+'
    end
  end

end
end
