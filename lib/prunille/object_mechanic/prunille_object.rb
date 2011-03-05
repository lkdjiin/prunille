# -*- encoding: utf-8 -*-
module Prunille::ObjectMechanic
  
  # The root of the Prunille objects hieriarchy
  class PrunilleObject < Hash
    
    # @raise ArgumentError if a parent is not a descendant of PrunilleObject
    def initialize
      self[:slots] = {}
      self[:parents] = []
    end
    
    def inherit parent
      raise ArgumentError unless parent.kind_of? PrunilleObject
      self[:parents] << parent
    end
    
  end
  
end
