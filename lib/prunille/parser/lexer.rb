# -*- encoding: utf-8 -*-

module Prunille

  # I produce a list of lexical unit from a line of code.
  #
  # +Lexical unit summary:+
  # * :class
  #   Object, Foo-Bar, Boeing747, etc.
  # * :identifier
  #   variable, a-var, i-am-the-123-th, etc.
  # * :integer
  #   123, 06, 0, etc.
  #
  # @note All leading spaces must be removed BEFORE we proceed any
  #   lexical analyse. Empty lines are not allowed.
  class Lexer
  
    def initialize symbol_table
      @symbol_table = symbol_table
      @parsing = []
      @token = nil
      @unit = LexicalUnit.new symbol_table
    end
  
    def parse codeline
      initialize_parsing codeline
      while @tokenizer.has_more_token?
        @token = @tokenizer.next_token 
        @parsing << @unit.produce_from(@token)
      end
      raise LexerParseError, "Unexpected token" if @parsing.empty?
      @parsing
    end
    
    private
    
    def initialize_parsing codeline
      @tokenizer = Tokenizer.new(codeline)
      @parsing = []
    end
    
  end
  
  # Raises if any errors occured in the lexical analyser
  class LexerParseError < StandardError
  end

end
