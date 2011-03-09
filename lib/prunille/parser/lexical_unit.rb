module Prunille

  # I produce a lexical unit from a token.
  #
  # |-------------|-----------------------------|
  # | INPUT       | OUTPUT                      |
  # |-------------|-----------------------------|
  # | 1234        | [:integer, 1234]            |
  # | 'new'       | [:keyword, :new]            |
  # | 'Foo-Bar'   | [:class, :"Foo-Bar"]        |
  # | 'boeing747' | [:identifier, :"boeing747"] |
  # |-------------|-----------------------------|
  class LexicalUnit
  
    def initialize symbol_table
      @symbol_table = symbol_table
      @token = nil
    end
    
    def produce_from token
      @token = token
      if @token.is_a?(Fixnum)
        [:integer, @token]
      elsif @token.is_a?(String)
        identify_string_token
      end
    end
    
    private
    
    def identify_string_token
      symb = @token.to_sym
      if @symbol_table[@token] != nil
        [:keyword, symb]
      elsif @token =~ /[A-Z]([A-Z]|[a-z]|-|[0-9])*/
       [:class, symb]
      elsif @token =~ /[a-z]([A-Z]|[a-z]|-|[0-9])*/
        [:identifier, symb]
      end
    end
    
  end

end
