# -*- encoding: utf-8 -*-
module Prunille

  # Serialization of bytecode
  class BytecodeIO
  
    # @param [String] filename The filename without extension
    def self.dump bytecode, filename
      data = Marshal.dump bytecode
      out = File.new(filename + '.pc', "wb")
			out.write data
			out.close
    end
    
    # @param [String] filename The filename without extension
    def self.load filename
      data = open(filename + '.pc', "rb") {|io| io.read }
      Marshal.load(data)
    end
    
  end

end
