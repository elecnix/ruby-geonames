module Geonames
  class CountryInfo
    attr_reader :country_code, :country_name, :iso_numeric, :iso_alpha_3
    attr_reader :fips_code, :continent, :capital, :area_sq_km, :population
    attr_reader :currency_code, :geoname_id
    
    attr_writer :country_code, :country_name, :iso_numeric, :iso_alpha_3
    attr_writer :fips_code, :continent, :capital, :area_sq_km, :population
    attr_writer :currency_code, :geoname_id
    
    def initialize
      @langs = []
      @bounding_box = BoundingBox.new()
    end
    
    def bounding_box
      return @bounding_box
    end
    
    def bounding_box=(new_bb)
      @bounding_box = new_bb
    end
    
    def set_bounding_box(north, south, east, west)
      @bounding_box = BoundingBox.new(north, south, east, west)
    end
    
    def languages
      return @langs
    end
    
    def languages=(new_langs)
      @langs = new_langs
    end
  end
end
