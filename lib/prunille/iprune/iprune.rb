module Prunille::IPrune

  PROMPT = 'iprune> '
  RESPONSE = '=> '
  
  # Interactive console for the Prunille language.
  class IPrune
  
    def process
      loop do
        print PROMPT
        line = gets.chomp
        puts RESPONSE + line
      end
    end
    
  end
  
end
