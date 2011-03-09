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
    end
  
    def parse codeline
      initialize_parsing codeline
      while @tokenizer.has_more_token?
        @token = @tokenizer.next_token 
        add_lexical_unit_to_parsing
      end
      raise LexerParseError if @parsing.empty?
      @parsing
    end
    
    private
    
    def initialize_parsing codeline
      @tokenizer = Tokenizer.new(codeline)
      @parsing = []
    end
    
    def add_lexical_unit_to_parsing
      if @token.is_a?(Fixnum)
        @parsing << [:integer, @token]
      elsif @token.is_a?(String)
        identify_string_token
      end
    end
    
    def identify_string_token
      symb = @token.to_sym
      if @symbol_table[@token] != nil
        @parsing << [:keyword, symb]
      elsif @token =~ /[A-Z]([A-Z]|[a-z]|-|[0-9])*/
        @parsing << [:class, symb]
      elsif @token =~ /[a-z]([A-Z]|[a-z]|-|[0-9])*/
        @parsing << [:identifier, symb]
      end
    end
    
  end
  
  # Raises if any errors occured in the lexical analyser
  class LexerParseError < Exception
  end

end
