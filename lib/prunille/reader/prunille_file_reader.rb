# -*- encoding: utf-8 -*-
module Prunille::Reader

  # I know how to get things from a prunille source file.
  class PrunilleFileReader
  
    # Get source as an array of lines.
    def self.read(filename)
      IO.readlines(filename).map {|elem| elem.chomp}
    end
    
  end
  
end
