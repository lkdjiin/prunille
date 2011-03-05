# -*- encoding: utf-8 -*-
module Prunille

  # Process a Prunille program.
  class Main
  
    def initialize filename
      @filename = filename
      unless prunille_extension? and File.exist? filename
        raise ArgumentError
      end
      @source_lines = Reader::PrunilleFileReader.read @filename
      @parser = Prunille::Parser::Parser.new
    end
    
    def process
      @source_lines.each do |line|
        puts @parser.parse(line).inspect
      end
    end
    
    private
    
    def prunille_extension?
      @filename.match /.prunille$/
    end
    
  end
  
end
