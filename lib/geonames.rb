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

require_relative 'web_service'
require_relative 'toponym'
require_relative 'toponym_search_result'
require_relative 'toponym_search_criteria'
require_relative 'postal_code'
require_relative 'postal_code_search_criteria'
require_relative 'timezone'
require_relative 'country_subdivision'
require_relative 'wikipedia_article'
require_relative 'intersection'
require_relative 'bounding_box'

module Geonames
  autoload :Config,  'geonames/config'

  GEONAMES_SERVER = "http://ws.geonames.org"
  USER_AGENT = "geonames ruby webservice client 0.1"

  class << self

    def config
        $config ||= Geonames::Config.new
    end

    %w(lang username base_url password radius).each do |method|
      module_eval <<-DELEGATORS, __FILE__, __LINE__ + 1
        def #{method}
          config.#{method}
        end

        def #{method}=(value)
          config.#{method} = (value)
        end
      DELEGATORS
    end

  end

end

