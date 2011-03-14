# -*- encoding: utf-8 -*-
module Prunille

  # Raised when an error occured into the stack machine.
  # Currently, the only error arise when we try to pop an empty stack.
  class StackError < StandardError
  end

  # I run the code.
  class StackMachine
  
    def initialize
      @stack = []
    end
    
    def push value
      @stack << value
    end
    
    def pop
      raise StackError, "Poping a value but the stack is empty." if @stack.empty?
      @stack.pop
    end
    
    def add
      math_instruction '+'
    end
    
    def sub
      math_instruction '-'
    end
    
    def mul
      math_instruction '*'
    end
    
    def div
      math_instruction '/'
    end
    
    def mod
      math_instruction '%'
    end
    
    private
    
    def math_instruction op
      second = @stack.pop
      first = @stack.pop
      @stack << first.send(op, second)
    end
    
  end
  
end
