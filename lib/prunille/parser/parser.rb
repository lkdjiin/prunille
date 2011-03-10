# -*- encoding: utf-8 -*-
module Prunille

  # I transform the output from Lexer in something more suitable
  # for the stack machine.
  #
  # @todo This class does 2 things:
  #   1. checks grammar (lexical unit > syntaxic unit)
  #   2. does postfix
  class Parser
  
    def parse lexical_units
      initialize_parsing lexical_units
      terme
      loop do
        if add_operator?
          parse_body
        else
          break
        end
      end
      @parsing
    end
    
    private
    
    def initialize_parsing lexical_units
      @parsing = []
      @units = lexical_units
      @current = @units[0]
      @index = 1
    end
    
    def add_operator?
      operator? ['+', '-']
    end
    
    def mult_operator?
      operator? ['*', '÷']
    end
    
    def operator? values
      return false if @current.nil?
      type = @current[0]
      value = @current[1]
      type == :sign and values.include?(value)
    end
    
    def parse_body
      next_method = method 'terme'
      units = [[:sign, '+'], [:sign, '-']]
      message = "Expected one of '+', '-'"
      operation_body next_method, units, message
    end
    
    def operation_body next_method, units, message
      unit = @current
      accept unit[0]
      next_method.call
      if units.include?(unit)
        @parsing <<  unit
      else
        puts message
      end
    end
    
    def terme
      factor
      loop do
        if mult_operator?
          terme_body
        else
          break
        end
      end
    end
    
    def terme_body
      next_method = method 'factor'
      units = [[:sign, '*'], [:sign, '÷']]
      message = "Expected one of '*', '÷'"
      operation_body next_method, units, message
    end
    
    def accept type
      if @current[0] == type
        @current = @units[@index]
        @index += 1
      else
        puts "error"
      end
    end
    
    def factor
      case @current[0]
        when :integer then integer
        else
          puts "Error, I need an expression"
      end
    end
    
    def integer
      @parsing <<  @current
      accept :integer
    end
    
  end

end
