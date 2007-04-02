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
      postal_code = PostalCode.new

      postal_code.admin_code_1    = WebService::get_element_child_text( element, 'adminCode1' )
      postal_code.admin_code_2    = WebService::get_element_child_text( element, 'adminCode2' )
      postal_code.admin_name_1    = WebService::get_element_child_text( element, 'adminName1' )
      postal_code.admin_name_2    = WebService::get_element_child_text( element, 'adminName2' )
      postal_code.country_code    = WebService::get_element_child_text( element, 'countryCode' )
      postal_code.distance        = WebService::get_element_child_float( element, 'distance' )
      postal_code.longitude       = WebService::get_element_child_float( element, 'lat' )
      postal_code.latitude        = WebService::get_element_child_float( element, 'lng' )
      postal_code.place_name      = WebService::get_element_child_text( element, 'name' )
      postal_code.postal_code     = WebService::get_element_child_text( element, 'postalcode' )

      return postal_code

    end

    def WebService.element_to_wikipedia_article ( element )
      article = WikipediaArticle.new

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
      toponym = Toponym.new

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
      toponym.feature_code_name   = WebService::get_element_child_text( element, 'fCodeName' )
      toponym.population          = WebService::get_element_child_int( element, 'population' )
      toponym.elevation           = WebService::get_element_child_text( element, 'elevation' )
      toponym.distance            = WebService::get_element_child_float( element, 'distance' )

      return toponym

    end

    def WebService.element_to_intersection ( element )
      intersection = Intersection.new

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

    def WebService.postal_code_search( postal_code, place_name, country_code )
      postal_code_sc = PostalCodeSearchCriteria.new
      postal_code_sc.postal_code = postal_code
      postal_code_sc.place_name = place_name
      postal_code_sc.coutry_code = country_code

      WebService.postal_code_search postal_code_sc
    end

    def WebService.postal_code_search( search_criteria )
      # postal codes to reutrn
      postal_codes = Array.new

      url = Geonames::GEONAMES_SERVER + "/postalCodeSearch?a=a"
      url = url + search_criteria.to_query_params_string

      uri = URI.parse(url)

      req = Net::HTTP::Get.new(uri.path + '?' + uri.query)

      res = Net::HTTP.start( uri.host, uri.port ) { |http|
        http.request( req )
      }

      doc = REXML::Document.new res.body

      doc.elements.each("geonames/code") do |element|
        postal_codes << WebService::element_to_postal_code( element )
      end

      postal_codes

    end

    def WebService.find_nearby_postal_codes( search_criteria )
      # postal codes to reutrn
      postal_codes = Array.new

      url = Geonames::GEONAMES_SERVER + "/findNearbyPostalCodes?a=a"
      url = url + search_criteria.to_query_params_string

      uri = URI.parse(url)

      req = Net::HTTP::Get.new(uri.path + '?' + uri.query)

      res = Net::HTTP.start( uri.host, uri.port ) { |http|
        http.request( req )
      }

      doc = REXML::Document.new res.body

      doc.elements.each("geonames/code") do |element|
        postal_codes << WebService::element_to_postal_code( element )
      end

      postal_codes

    end

    def WebService.find_nearby_place_name( lat, long )
      places = Array.new

      url = Geonames::GEONAMES_SERVER + "/findNearbyPlaceName?a=a"

      url = url + "&lat=" + lat.to_s
      url = url + "&lng=" + long.to_s

      uri = URI.parse(url)

      req = Net::HTTP::Get.new(uri.path + '?' + uri.query)

      res = Net::HTTP.start( uri.host, uri.port ) { |http|
        http.request( req )
      }

      doc = REXML::Document.new res.body

      doc.elements.each("geonames/geoname") do |element|

        places << WebService::element_to_toponym( element )

      end

      return places

    end

    def WebService.find_nearest_intersection( lat, long )

      url = Geonames::GEONAMES_SERVER + "/findNearestIntersection?a=a"

      url = url + "&lat=" + lat.to_s
      url = url + "&lng=" + long.to_s

      uri = URI.parse(url)

      req = Net::HTTP::Get.new(uri.path + '?' + uri.query)

      res = Net::HTTP.start( uri.host, uri.port ) { |http|
        http.request( req )
      }

      doc = REXML::Document.new res.body

      intersection = []
      doc.elements.each("geonames/intersection") do |element|

        intersection = WebService::element_to_intersection( element )

      end

      return intersection

    end

    def WebService.timezone( lat, long )
      timezone = Timezone.new

      url = Geonames::GEONAMES_SERVER + "/timezone?a=a"

      url = url + "&lat=" + lat.to_s
      url = url + "&lng=" + long.to_s

      uri = URI.parse(url)

      req = Net::HTTP::Get.new(uri.path + '?' + uri.query)

      res = Net::HTTP.start( uri.host, uri.port ) { |http|
        http.request( req )
      }

      doc = REXML::Document.new res.body

      doc.elements.each("geonames/timezone") do |element|
        timezone.timezone_id    = WebService::get_element_child_text( element, 'timezoneId' )
        timezone.gmt_offset     = WebService::get_element_child_float( element, 'gmtOffset' )
        timezone.dst_offset     = WebService::get_element_child_float( element, 'dstOffset' )
      end

      return timezone

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

      url = Geonames::GEONAMES_SERVER + "/findNearbyWikipedia?a=a"

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

      uri = URI.parse(url)

      req = Net::HTTP::Get.new(uri.path + '?' + uri.query)

      res = Net::HTTP.start( uri.host, uri.port ) { |http|
        http.request( req )
      }

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

      url = Geonames::GEONAMES_SERVER + "/wikipediaBoundingBox?a=a"

      url = url + "&north=" + north.to_s
      url = url + "&east=" + east.to_s
      url = url + "&south=" + south.to_s
      url = url + "&west=" + west.to_s
      url = url + "&radius=" + radius.to_s unless radius.nil?
      url = url + "&max_rows=" + max_rows.to_s unless max_rows.nil?

      uri = URI.parse(url)

      req = Net::HTTP::Get.new(uri.path + '?' + uri.query)

      res = Net::HTTP.start( uri.host, uri.port ) { |http|
        http.request( req )
      }

      doc = REXML::Document.new res.body

      doc.elements.each("geonames/entry") do |element|
        articles << WebService::element_to_wikipedia_article( element )
      end

      return articles

    end

    def WebService.country_subdivision ( lat, long )
      country_subdivision = CountrySubdivision.new

      url = Geonames::GEONAMES_SERVER + "/countrySubdivision?a=a"

      url = url + "&lat=" + lat.to_s
      url = url + "&lng=" + long.to_s

      uri = URI.parse(url)

      req = Net::HTTP::Get.new(uri.path + '?' + uri.query)

      res = Net::HTTP.start( uri.host, uri.port ) { |http|
        http.request( req )
      }

      doc = REXML::Document.new res.body

      doc.elements.each("geonames/countrySubdivision") do |element|
        country_subdivision.country_code    = WebService::get_element_child_text( element, 'countryCode' )
        country_subdivision.country_name    = WebService::get_element_child_text( element, 'countryName' )
        country_subdivision.admin_code_1    = WebService::get_element_child_text( element, 'adminCode1' )
        country_subdivision.admin_name_1    = WebService::get_element_child_text( element, 'adminName1' )
      end

      return country_subdivision

    end

    def WebService.country_code ( lat, long )

      url = Geonames::GEONAMES_SERVER + "/countrycode?a=a"

      url = url + "&lat=" + lat.to_s
      url = url + "&lng=" + long.to_s

      uri = URI.parse(url)

      req = Net::HTTP::Get.new(uri.path + '?' + uri.query)

      res = Net::HTTP.start( uri.host, uri.port ) { |http|
        http.request( req )
      }

      doc = REXML::Document.new res.body

      return res.body.strip

    end

    def WebService.search( search_criteria )
      #toponym search results to return
      toponym_sr = ToponymSearchResult.new

      url = Geonames::GEONAMES_SERVER + "/search?a=a"

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

      uri = URI.parse(url)

      req = Net::HTTP::Get.new(uri.path + '?' + uri.query)

      res = Net::HTTP.start( uri.host, uri.port ) { |http|
        http.request( req )
      }

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
