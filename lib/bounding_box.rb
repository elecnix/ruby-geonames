module Geonames
  class BoundingBox
    attr_reader :north_point, :south_point, :east_point, :west_point
    attr_writer :north_point, :south_point, :east_point, :west_point
    
    def initialize(north=0.0, south=0.0, east=0.0, west=0.0)
      self.north_point = north
      self.south_point = south
      self.east_point = east
      self.west_point = west
    end
    
    def contains?(point)
      #todo implement me
      return false
    end
  end
end