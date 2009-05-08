$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'geonames'
require 'test/unit'

class TestCountryInfo < Test::Unit::TestCase
  def setup
    @test_code = "TH"
    
    @expected = 
      {:country_code => 'TH', :country_name => 'Thailand', :iso_numeric => 764,
        :iso_alpha_3 => 'THA', :fips_code => 'TH', :continent => 'AS', 
        :capital => 'Bangkok', :area_sq_km => 514000.0, :population => 65493000,
        :currency_code => 'THB', :geonameId => 1605651, 
        :languages => ['th', 'en'],
        :box_north => 20.4631977081299, :box_south => 5.60999917984009, 
        :box_east => 105.63939666748, :box_west => 97.3456268310547}
  end
  
  def teardown
    #nothing here really
  end
  
  def test_simple_values
    info = Geonames::WebService.country_info(@test_code)
    
    assert_equal(@expected[:country_code], info.country_code)
    assert_equal(@expected[:country_name], info.country_name)
    assert_equal(@expected[:iso_numeric], info.iso_numeric)
    assert_equal(@expected[:iso_alpha_3], info.iso_alpha_3)
    assert_equal(@expected[:fips_code], info.fips_code)
    assert_equal(@expected[:continent], info.continent)
    assert_equal(@expected[:capital], info.capital)
    assert_equal(@expected[:area_sq_km], info.area_sq_km)
    assert_equal(@expected[:population], info.population)
    assert_equal(@expected[:currency_code], info.currency_code)
    assert_equal(@expected[:geonameId], info.geoname_id )
  end
  
  def test_languages
    info = Geonames::WebService.country_info(@test_code)
    
    assert_equal(2, info.languages.size)
    assert_equal(@expected[:languages][0], info.languages[0])
    assert_equal(@expected[:languages][1], info.languages[1])
  end
  
  def test_bounding_box
    info = Geonames::WebService.country_info(@test_code)
    
    assert_equal(@expected[:box_north], info.bounding_box.north_point)
    assert_equal(@expected[:box_south], info.bounding_box.south_point)
    assert_equal(@expected[:box_east], info.bounding_box.east_point)
    assert_equal(@expected[:box_west], info.bounding_box.west_point)
  end
end