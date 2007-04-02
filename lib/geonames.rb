#=============================================================================
#
# Copyright 2007 Adam Wisniewski <adamw@tbcn.ca> 
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

require 'cgi'
require 'net/http'
require 'rexml/document'

require 'web_service'
require 'toponym'
require 'toponym_search_result'
require 'toponym_search_criteria'
require 'postal_code'
require 'postal_code_search_criteria'
require 'timezone'
require 'country_subdivision'
require 'wikipedia_article'
require 'intersection'

module Geonames
  
  GEONAMES_SERVER = "http://ws.geonames.org"
  USER_AGENT = "geonames ruby webservice client 0.1"
  
end

