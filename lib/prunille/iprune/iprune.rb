# -*- encoding: utf-8 -*-
module Prunille::IPrune

  RESPONSE = '=> '
  
  # Interactive console for the Prunille language.
  class IPrune
  
    def initialize
      @line_number = 1
    end
  
    def process
      loop do
        prompt
        line = gets.chomp
        puts RESPONSE + line
      end
    end
    
    private
    
    def prompt
      print "iprune:#{format('%03d', @line_number)}> "
    end
    
  end
  
end
