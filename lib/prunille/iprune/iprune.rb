# -*- encoding: utf-8 -*-
module Prunille
  
  # Interactive console for the Prunille language.
  class IPrune
  
    def initialize
      @line_number = 0
      @parser = Parser.new(SymbolTable.new)
      @stack = StackMachine.new
      @bytecoder = Bytecoder.new
    end
    
    def eval_expression line
      return nil if line == ''
      do_eval line
    end
    
    def prompt
      @line_number += 1
      "iprune:#{format('%03d', @line_number)}> "
    end
    
    private
    
    def do_eval line
      begin
        parsing = @parser.parse(line)
        bytecode = @bytecoder.generate(parsing)
        call_stack_machine(bytecode)
        [@stack.pop, false]
      rescue SyntaxError, LexerParseError => ex
        ["#{ex.class}\n   #{ex.message}", true]
      end
    end
    
    def call_stack_machine bytecode
      bytecode.each do |instruction|
        case instruction.first # This is the operand
          when :push then @stack.push instruction[1]
          when :add then @stack.add
          when :sub then @stack.sub
        end
      end
    end
    
  end
  
end
