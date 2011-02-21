# -*- encoding: utf-8 -*-

# Main namespace for the Prunille language.
module Prunille
module Parser

  # A single statement of the language
  class Statement < Treetop::Runtime::SyntaxNode
    def to_array
      ret = self.elements.map {|elem| elem.to_array if elem.respond_to?(:to_array)}
      ret.delete nil
      ret
    end
  end
  
  # A operation, in the sense of the language
  class Operation  < Treetop::Runtime::SyntaxNode
    def to_array
      ret = self.elements.map {|elem| elem.to_array if elem.respond_to?(:to_array)}
      ret.delete nil
      [:operation, ret]
    end
  end

  # A text terminal
  class TextLiteral < Treetop::Runtime::SyntaxNode
    def to_array
      [:text, self.text_value[1..-2]]
    end
  end
  
  # Keywords of the language
  class Keyword < Treetop::Runtime::SyntaxNode
    def to_array
      [:keyword, self.text_value.to_sym]
    end
  end

  # An identifier terminal
  class Identifier < Treetop::Runtime::SyntaxNode
    def to_array
      [:identifier, self.text_value.to_sym]
    end
  end
  
  # An integer terminal
  class IntegerLiteral < Treetop::Runtime::SyntaxNode
    def to_array
      [:integer, self.text_value.to_i]
    end
  end

  # A terminal that is a sequence of leading spaces
  class Spaces < Treetop::Runtime::SyntaxNode
    def to_array
      [:spaces, self.text_value.size]
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
