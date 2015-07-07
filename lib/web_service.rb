#=============================================================================
#
# Copyright 2007 Adam Wisniewski <adamw@tbcn.ca>
# Contributions by Andrew Turner, High Earth Orbit
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.
#
#=============================================================================

module Geonames
  class WebService
    def WebService.get_element_child_text( element, child )
      if !element.elements[child].nil?
        element.elements[child][0].to_s
      end
    end

    def WebService.get_element_child_float( element, child )
      if !element.elements[child].nil?
        element.elements[child][0].to_s.to_f
      end
    end

    def WebService.get_element_child_int( element, child )
      if !element.elements[child].nil?
        element.elements[child][0].to_s.to_i
      end
    end

    def WebService.element_to_postal_code ( element )
      postal_code = Geonames::PostalCode.new

      postal_code.admin_code_1    = WebService::get_element_child_text( element, 'adminCode1' )
      postal_code.admin_code_2    = WebService::get_element_child_text( element, 'adminCode2' )
      postal_code.admin_name_1    = WebService::get_element_child_text( element, 'adminName1' )
      postal_code.admin_name_2    = WebService::get_element_child_text( element, 'adminName2' )
      postal_code.country_code    = WebService::get_element_child_text( element, 'countryCode' )
      postal_code.distance        = WebService::get_element_child_float( element, 'distance' )
      postal_code.longitude       = WebService::get_element_child_float( element, 'lng' )
      postal_code.latitude        = WebService::get_element_child_float( element, 'lat' )
      postal_code.place_name      = WebService::get_element_child_text( element, 'name' )
      postal_code.postal_code     = WebService::get_element_child_text( element, 'postalcode' )

      return postal_code

    end

    def WebService.element_to_wikipedia_article ( element )
      article = Geonames::WikipediaArticle.new

      article.language              = WebService::get_element_child_text( element, 'lang' )
      article.title                 = WebService::get_element_child_text( element, 'title' )
      article.summary               = WebService::get_element_child_text( element, 'summary' )
      article.wikipedia_url         = WebService::get_element_child_text( element, 'wikipediaUrl' )
      article.feature               = WebService::get_element_child_text( element, 'feature' )
      article.population            = WebService::get_element_child_text( element, 'population' )
      article.elevation             = WebService::get_element_child_text( element, 'elevation' )
      article.latitude              = WebService::get_element_child_float( element, 'lat' )
      article.longitude             = WebService::get_element_child_float( element, 'lng' )
      article.thumbnail_img         = WebService::get_element_child_text( element, 'thumbnailImg' )
      article.distance              = WebService::get_element_child_float( element, 'distance' )

      return article

    end

    def WebService.element_to_toponym ( element )
      toponym = Geonames::Toponym.new

      toponym.name                = WebService::get_element_child_text( element, 'name' )
      toponym.alternate_names     = WebService::get_element_child_text( element, 'alternateNames' )
      toponym.latitude            = WebService::get_element_child_float( element, 'lat' )
      toponym.longitude           = WebService::get_element_child_float( element, 'lng' )
      toponym.geoname_id          = WebService::get_element_child_text( element, 'geonameId' )
      toponym.country_code        = WebService::get_element_child_text( element, 'countryCode' )
      toponym.country_name        = WebService::get_element_child_text( element, 'countryName' )
      toponym.feature_class       = WebService::get_element_child_text( element, 'fcl' )
      toponym.feature_code        = WebService::get_element_child_text( element, 'fcode' )
      toponym.feature_class_name  = WebService::get_element_child_text( element, 'fclName' )
      toponym.feature_code_name   = WebService::get_element_child_text( element, 'fcodeName' )
      toponym.population          = WebService::get_element_child_int( element, 'population' )
      toponym.elevation           = WebService::get_element_child_text( element, 'elevation' )
      toponym.distance            = WebService::get_element_child_float( element, 'distance' )
      toponym.admin_code_1        = WebService::get_element_child_text( element, 'adminCode1' )
      toponym.admin_code_2        = WebService::get_element_child_text( element, 'adminCode2' )
      toponym.admin_name_1        = WebService::get_element_child_text( element, 'adminName1' )
      toponym.admin_name_2        = WebService::get_element_child_text( element, 'adminName2' )

      return toponym

    end

    def WebService.element_to_intersection ( element )
      intersection = Geonames::Intersection.new

      intersection.street_1        = WebService::get_element_child_text( element, 'street1' )
      intersection.street_2        = WebService::get_element_child_text( element, 'street2' )
      intersection.admin_code_1    = WebService::get_element_child_text( element, 'adminCode1' )
      intersection.admin_code_1    = WebService::get_element_child_text( element, 'adminCode1' )
      intersection.admin_code_2    = WebService::get_element_child_text( element, 'adminCode2' )
      intersection.admin_name_1    = WebService::get_element_child_text( element, 'adminName1' )
      intersection.admin_name_2    = WebService::get_element_child_text( element, 'adminName2' )
      intersection.country_code    = WebService::get_element_child_text( element, 'countryCode' )
      intersection.distance        = WebService::get_element_child_float( element, 'distance' )
      intersection.longitude       = WebService::get_element_child_float( element, 'lat' )
      intersection.latitude        = WebService::get_element_child_float( element, 'lng' )
      intersection.place_name      = WebService::get_element_child_text( element, 'name' )
      intersection.postal_code     = WebService::get_element_child_text( element, 'postalcode' )

      return intersection

    end
    
    def WebService.element_to_country_info(element)
      country_info = Geonames::CountryInfo.new
      country_info.country_code = WebService.get_element_child_text(element, 'countryCode')
      country_info.country_name = WebService.get_element_child_text(element, 'countryName')
      country_info.iso_numeric = WebService.get_element_child_int(element, 'isoNumeric')
      country_info.iso_alpha_3 = WebService.get_element_child_text(element, 'isoAlpha3')
      country_info.fips_code = WebService.get_element_child_text(element, 'fipsCode')
      country_info.continent = WebService.get_element_child_text(element, 'continent')
      country_info.capital = WebService.get_element_child_text(element, 'capital')
      country_info.area_sq_km = WebService.get_element_child_float(element, 'areaInSqKm')
      country_info.population = WebService.get_element_child_int(element, 'population')
      country_info.currency_code = WebService.get_element_child_text(element, 'currencyCode')
      #actually an array of the available languages
      country_info.languages = WebService.get_element_child_text(element, 'languages').split(",")
      country_info.geoname_id = WebService.get_element_child_int(element, 'geonameId')
      
      north = WebService.get_element_child_float(element, 'bBoxNorth')
      south = WebService.get_element_child_float(element, 'bBoxSouth')
      east = WebService.get_element_child_float(element, 'bBoxEast')
      west = WebService.get_element_child_float(element, 'bBoxWest')
      
      country_info.set_bounding_box(north, south, east, west)
      
      return country_info
    end

    def WebService.postal_code_search( postal_code, place_name, country_code,*args )
      postal_code_sc = Geonames::PostalCodeSearchCriteria.new
      postal_code_sc.postal_code = postal_code
      postal_code_sc.place_name = place_name
      postal_code_sc.country_code = country_code

      WebService.postal_code_search postal_code_sc, args
    end

    def WebService.postal_code_search( search_criteria, *args )
      # postal codes to reutrn
      postal_codes = Array.new

      url = "/postalCodeSearch?a=a"
      url = url + search_criteria.to_query_params_string

      res = make_request(url,args)

      doc = REXML::Document.new res.body

      doc.elements.each("geonames/code") do |element|
        postal_codes << WebService::element_to_postal_code( element )
      end

      postal_codes

    end

    def WebService.find_nearby_postal_codes( search_criteria )
      # postal codes to reutrn
      postal_codes = Array.new

      url = "/findNearbyPostalCodes?a=a"
      url = url + search_criteria.to_query_params_string

      res = make_request(url)

      doc = REXML::Document.new res.body

      doc.elements.each("geonames/code") do |element|
        postal_codes << WebService::element_to_postal_code( element )
      end

      postal_codes

    end

    def WebService.find_nearby_place_name( lat, long )
      places = Array.new

      url = "/findNearbyPlaceName?a=a"

      url = url + "&lat=" + lat.to_s
      url = url + "&lng=" + long.to_s

      res = make_request(url)

      doc = REXML::Document.new res.body

      doc.elements.each("geonames/geoname") do |element|

        places << WebService::element_to_toponym( element )

      end

      return places

    end

    def WebService.find_nearest_intersection( lat, long )

      url = "/findNearestIntersection?a=a"

      url = url + "&lat=" + lat.to_s
      url = url + "&lng=" + long.to_s

      res = make_request(url)

      doc = REXML::Document.new res.body

      intersection = []
      doc.elements.each("geonames/intersection") do |element|

        intersection = WebService::element_to_intersection( element )

      end

      return intersection

    end

    def WebService.timezone( lat, long, *args )
      res = make_request("/timezone?lat=#{lat.to_s}&lng=#{long.to_s}", args)
      doc = REXML::Document.new res.body
      timezone = Timezone.new
      doc.elements.each("geonames/timezone") do |element|
        timezone.timezone_id    = WebService::get_element_child_text( element, 'timezoneId' )
        timezone.gmt_offset     = WebService::get_element_child_float( element, 'gmtOffset' )
        timezone.dst_offset     = WebService::get_element_child_float( element, 'dstOffset' )
      end
      timezone
    end

    def WebService.make_request(path_and_query, *args)
      url = Geonames.base_url + path_and_query
      url += "&username=#{Geonames.username}" if Geonames.username
      url += "&password=#{Geonames.password}" if Geonames.password
      url += "&radius=#{Geonames.radius}"
      url += "&lang=#{Geonames.lang}"
      options = {
        :open_timeout => 60,
        :read_timeout => 60
      }
      options.update(args.last.is_a?(::Hash) ? args.pop : {})
      uri = URI.parse(url)
      req = Net::HTTP::Get.new(uri.path + '?' + uri.query)
      Net::HTTP.start(uri.host, uri.port) { |http|
        http.read_timeout = options[:read_timeout]
        http.open_timeout = options[:open_timeout]
        http.request(req)
      }
    end

    def WebService.findNearbyWikipedia( hashes )
      # here for backwards compatibility
      WebService.find_nearby_wikipedia( hashes )
    end
    
    def WebService.find_nearby_wikipedia( hashes )
      articles = Array.new

      lat = hashes[:lat]
      long = hashes[:long]
      lang = hashes[:lang]
      radius = hashes[:radius]
      max_rows = hashes[:max_rows]
      country = hashes[:country]
      postalcode = hashes[:postalcode]
      q = hashes[:q]

      url = "/findNearbyWikipedia?a=a"

      if !lat.nil? && !long.nil?
        url = url + "&lat=" + lat.to_s
        url = url + "&lng=" + long.to_s
        url = url + "&radius=" + radius.to_s unless radius.nil?
        url = url + "&max_rows=" + max_rows.to_s unless max_rows.nil?

      elsif !q.nil?
        url = url + "&q=" + q
        url = url + "&radius=" + radius.to_s unless radius.nil?
        url = url + "&max_rows=" + max_rows.to_s unless max_rows.nil?
      end

      res = make_request(url)

      doc = REXML::Document.new res.body

      doc.elements.each("geonames/entry") do |element|
        articles << WebService::element_to_wikipedia_article( element )
      end

      return articles

    end

    def WebService.findBoundingBoxWikipedia( hashes )
      # here for backwards compatibility
      WebService.find_bounding_box_wikipedia( hashes )
    end
    
    def WebService.find_bounding_box_wikipedia( hashes )
      articles = Array.new

      north = hashes[:north]
      east = hashes[:east]
      south = hashes[:south]
      west = hashes[:west]
      lang = hashes[:lang]
      radius = hashes[:radius]
      max_rows = hashes[:max_rows]
      country = hashes[:country]
      postalcode = hashes[:postalcode]
      q = hashes[:q]

      url = "/wikipediaBoundingBox?a=a"

      url = url + "&north=" + north.to_s
      url = url + "&east=" + east.to_s
      url = url + "&south=" + south.to_s
      url = url + "&west=" + west.to_s
      url = url + "&radius=" + radius.to_s unless radius.nil?
      url = url + "&max_rows=" + max_rows.to_s unless max_rows.nil?

      res = make_request(url)

      doc = REXML::Document.new res.body

      doc.elements.each("geonames/entry") do |element|
        articles << WebService::element_to_wikipedia_article( element )
      end

      return articles

    end

    def WebService.country_subdivision ( lat, long, radius = 0, maxRows = 1 )
      
      country_subdivisions = Array.new
      
      # maxRows is only implemented in the xml version:
      # http://groups.google.com/group/geonames/browse_thread/thread/f7f1bb2504ed216e
      # Therefore 'type=xml' is added:
      url = "/countrySubdivision?a=a&type=xml"

      url = url + "&lat=" + lat.to_s
      url = url + "&lng=" + long.to_s
      url = url + "&maxRows=" + maxRows.to_s
      url = url + "&radius=" + radius.to_s

      res = make_request(url)

      doc = REXML::Document.new res.body

      doc.elements.each("geonames/countrySubdivision") do |element|

        country_subdivision = CountrySubdivision.new

        country_subdivision.country_code    = WebService::get_element_child_text( element, 'countryCode' )
        country_subdivision.country_name    = WebService::get_element_child_text( element, 'countryName' )
        country_subdivision.admin_code_1    = WebService::get_element_child_text( element, 'adminCode1' )
        country_subdivision.admin_name_1    = WebService::get_element_child_text( element, 'adminName1' )
        country_subdivision.code_fips       = WebService::get_element_child_text( element, 'code[@type="FIPS10-4"]')
        country_subdivision.code_iso        = WebService::get_element_child_text( element, 'code[@type="ISO3166-2"]')

        country_subdivisions << country_subdivision

      end

      return country_subdivisions

    end

    def WebService.country_info(country_code = false)
      url = "/countryInfo?a=a"
      
      url += "&country=#{country_code.to_s}" if country_code
      res = make_request(url)
      
      doc = REXML::Document.new res.body
      
      countries = Array.new

      doc.elements.each("geonames/country") do |element|
        countries << WebService::element_to_country_info( element )
      end
      countries.size > 1 ? countries : countries[0]
    end

    def WebService.country_code ( lat, long, radius = 0, maxRows = 1 )
      # maxRows is only implemented in the xml version:
      # http://groups.google.com/group/geonames/browse_thread/thread/f7f1bb2504ed216e
      # Therefore 'type=xml' is added:
      url = "/countrycode?a=a&type=xml"

      countries = Array.new

      url = url + "&lat=" + lat.to_s
      url = url + "&lng=" + long.to_s
      url = url + "&maxRows=" + maxRows.to_s
      url = url + "&radius=" + radius.to_s

      res = make_request(url)

      doc = REXML::Document.new res.body

      doc.elements.each("geonames/country") do |element|

        countries << WebService::element_to_toponym( element )

      end

      return countries

    end

    def WebService.search( search_criteria )
      #toponym search results to return
      toponym_sr = ToponymSearchResult.new

      url = "/search?a=a"

      if !search_criteria.q.nil?
        url = url + "&q=" + CGI::escape( search_criteria.q )
      end

      if !search_criteria.name_equals.nil?
        url = url + "&name_equals=" + CGI::escape( search_criteria.name_equals )
      end

      if !search_criteria.name_starts_with.nil?
        url = url + "&name_startsWith=" + CGI::escape( search_criteria.name_starts_with )
      end

      if !search_criteria.name.nil?
        url = url + "&name=" + CGI::escape( search_criteria.name )
      end

      if !search_criteria.tag.nil?
        url = url + "&tag=" + CGI::escape( search_criteria.tag )
      end

      if !search_criteria.country_code.nil?
        url = url + "&country=" + CGI::escape( search_criteria.country_code )
      end

      if !search_criteria.admin_code_1.nil?
        url = url + "&adminCode1=" + CGI::escape( search_criteria.admin_code_1 )
      end

      if !search_criteria.language.nil?
        url = url + "&lang=" + CGI::escape( search_criteria.language )
      end

      if !search_criteria.feature_class.nil?
        url = url + "&featureClass=" + CGI::escape( search_criteria.feature_class )
      end

      if !search_criteria.feature_codes.nil?
        for feature_code in search_criteria.feature_codes
          url = url + "&fcode=" + CGI::escape( feature_code )
        end
      end

      if !search_criteria.max_rows.nil?
        url = url + "&maxRows=" + CGI::escape( search_criteria.max_rows )
      end

      if !search_criteria.start_row.nil?
        url = url + "&startRow=" + CGI::escape( search_criteria.start_row )
      end

      if !search_criteria.style.nil?
        url = url + "&style=" + CGI::escape( search_criteria.style )
      end
      
      res = make_request(url)

      doc = REXML::Document.new res.body

      toponym_sr.total_results_count = doc.elements["geonames/totalResultsCount"].text

      doc.elements.each("geonames/geoname") do |element|

        toponym_sr.toponyms << WebService::element_to_toponym( element )

      end

      return toponym_sr
    end
    
  end
end

#alias WebService.find_nearby_wikipedia findNearbyWikipedia
#alias find_bounding_box_wikipedia findBoundingBoxWikipedia
