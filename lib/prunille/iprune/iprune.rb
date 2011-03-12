# -*- encoding: utf-8 -*-
module Prunille

  RESPONSE = '=> '
  
  # Interactive console for the Prunille language.
  class IPrune
  
    def initialize
      @line_number = 0
      @parser = Parser.new(SymbolTable.new)
      @stack = StackMachine.new
    end
  
    def process
      loop do
        @line_number += 1
        prompt
        line = gets.chomp
        parsing = @parser.parse line
        parsing.each {|unit|
          if unit[0] == :integer
           @stack.push unit
          elsif unit[1] == '+'
            @stack.add
          else
            @stack.sub
          end
        }
        result = @stack.pop[1]
        puts "#{RESPONSE}#{result}"
      end
    end
    
    private
    
    def prompt
      print "iprune:#{format('%03d', @line_number)}> "
    end
    
  end
  
end
