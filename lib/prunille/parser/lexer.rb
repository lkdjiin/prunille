# -*- encoding: utf-8 -*-

module Prunille

  # All leading spaces must be removed BEFORE we proceed any
  # lexical analyse.
  class Lexer
  
    def initialize
      @index = 0
      @token = ''
      @look_ahead = ''
      @code_line = ''
    end
  
    def parse code_line
      @code_line = code_line
      ret = []
      forward_look_ahead
      while has_more_token?
        ret << next_token
      end
      ret
    end
    
    private
    
    def has_more_token?
      @index < @code_line.size
    end
    
    def forward_look_ahead
      @look_ahead = @code_line[@index, 1]
      @index += 1
    end
    
    def next_token
      if @look_ahead =~ /[A-Z]/
        while @look_ahead =~ /[A-Z]|[a-z]|-|[0-9]/
          @token << @look_ahead 
          forward_look_ahead
        end
        [:class, @token.to_sym]
      end
    end
    
  end

end
