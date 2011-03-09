# -*- encoding: utf-8 -*-

module Prunille

  # I produce a list of token from a line of Prunille code.
  #
  # +Token summary:+
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
  
    def initialize
      @index = 0
      @token = ''
      @look_ahead = ''
      @code_line = ''
      @parsing = []
    end
  
    def parse code_line
      initialize_parsing code_line
      forward_look_ahead
      @parsing << next_token while has_more_token?
      raise LexerParseError if @parsing.empty?
      @parsing
    end
    
    private
    
    def initialize_parsing code_line
      @code_line = code_line
      @parsing = []
      @index = 0
      @token = ''
    end
    
    def forward_look_ahead
      @look_ahead = @code_line[@index, 1]
      @index += 1
    end
    
    def has_more_token?
      @index < @code_line.size
    end
    
    def next_token
      if @look_ahead =~ /[A-Z]/
        get_classname
      elsif @look_ahead =~ /[a-z]/
        get_identifier
      elsif @look_ahead =~ /[0-9]/
        get_integer
      else
        raise LexerParseError
      end
    end
    
    def get_classname
      get_name
      [:class, @token.to_sym]
    end
    
    def get_identifier
      get_name
      [:identifier, @token.to_sym]
    end
    
    def get_name
      add_look_ahead while @look_ahead =~ /[A-Z]|[a-z]|-|[0-9]/
    end
    
    def get_integer
      add_look_ahead while @look_ahead =~ /[0-9]/
      [:integer, @token.to_i]
    end
    
    def add_look_ahead
      @token << @look_ahead 
      forward_look_ahead
    end
    
  end
  
  # Raises if any errors occured in the lexical analyser
  class LexerParseError < Exception
  end

end
