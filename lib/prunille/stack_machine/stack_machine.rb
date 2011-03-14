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
      value = @stack.pop + @stack.pop
      @stack << value
    end
    
    def sub
      second_term = @stack.pop
      first_term = @stack.pop
      @stack << first_term - second_term
    end
    
    def mul
      value = @stack.pop * @stack.pop
      @stack << value
    end
    
    def div
      second_term = @stack.pop
      first_term = @stack.pop
      @stack << first_term / second_term
    end
    
    def mod
      second_term = @stack.pop
      first_term = @stack.pop
      @stack << first_term % second_term
    end
    
  end
  
end
