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

require 'geonames'
require 'pp'

# get the nearest intersection
intersection = Geonames::WebService.find_nearest_intersection 40.7574053333333, -73.9734773333333
puts intersection.street_1 #=> Park Ave
puts intersection.street_2 #=> E 51st St

# get wikipedia articles by lat / long
articles_nearby = Geonames::WebService.find_nearby_wikipedia :lat => 43.900120387, :long => -78.882869834
p articles_nearby

# get wikipedia articles by bounding box
articles_nearby = Geonames::WebService.find_bounding_box_wikipedia :north => 43.900120387, :east => -78.882869834, :south => 43.82, :west => 79.0
p articles_nearby

# get list of places near by longitude/longitude location
places_nearby = Geonames::WebService.find_nearby_place_name 43.900120387, -78.882869834
p places_nearby

# get timezone for longitude/longitude location
timezone = Geonames::WebService.timezone 43.900120387, -78.882869834
p timezone

# get country code for longitude/longitude location
country_code = Geonames::WebService.country_code 43.900120387, -78.882869834
p country_code

# get country sub-division info for longitude/longitude location
country_subdivision = Geonames::WebService.country_subdivision 43.900120387, -78.882869834
p country_subdivision

# get postal codes for a given location
postal_code_sc = Geonames::PostalCodeSearchCriteria.new
postal_code_sc.place_name = "Oshawa"
postal_codes = Geonames::WebService.postal_code_search postal_code_sc
p postal_codes

# get nearby postal codes for a place name
postal_code_sc = Geonames::PostalCodeSearchCriteria.new
postal_code_sc.place_name = "Oshawa"
postal_codes_nearby = Geonames::WebService.find_nearby_postal_codes postal_code_sc
p postal_codes_nearby

