# -*- encoding: utf-8 -*-
module Prunille

  # Process a Prunille program.
  class Main
  
    def initialize filename
      @filename = filename
      unless prunille_source_file?
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
    
    def prunille_source_file?
      @filename.match /.prunille$/ and File.exist? @filename
    end
    
  end
  
end
