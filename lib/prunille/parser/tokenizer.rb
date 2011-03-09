# -*- encoding: utf-8 -*-

module Prunille

  # I produce the next token from a line of code on demand.
  #
  # What I can produce:
  # * name-like: "a-thing", "My-Class"
  # * integer-like: 123, 0
  class Tokenizer
  
    def initialize string
      @index = 0
      @token = ''
      @look_ahead = ''
      @codeline = string
      forward_look_ahead
    end
    
    def has_more_token?
      @index < @codeline.size
    end
    
    def next_token
      ret = produce_next_token
      skip_white
      @token = ''
      ret
    end
    
    private
    
    def produce_next_token
      if @look_ahead =~ /[A-Z]|[a-z]/
        get_name
      elsif @look_ahead =~ /[0-9]/
        get_integer
      else
        raise LexerParseError
      end
    end
    
    def forward_look_ahead
      @look_ahead = @codeline[@index, 1]
      @index += 1
    end
    
    def get_name
      add_look_ahead while @look_ahead =~ /[A-Z]|[a-z]|-|[0-9]/
      @token
    end
    
    def get_integer
      add_look_ahead while @look_ahead =~ /[0-9]/
      @token.to_i
    end
    
    def add_look_ahead
      @token << @look_ahead 
      forward_look_ahead
    end
    
    def skip_white
      forward_look_ahead while @look_ahead == ' '
    end
    
  end

end
