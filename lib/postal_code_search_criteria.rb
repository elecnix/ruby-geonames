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

module Geonames
    class PostalCodeSearchCriteria

	attr :postal_code
        attr :place_name
        attr :country_code
        attr :latitude
        attr :longitude
        attr :style
        attr :max_rows
        attr :is_or_operator
        attr :radius
        
        attr_writer :postal_code, :place_name, :country_code
        attr_writer :latitude, :longitude, :style
        attr_writer :max_rows,  :is_or_operator, :radius
        
        def initialize
          @is_or_operator = false
        end

        def to_query_params_string
            url = ''

            if !@postal_code.nil? 
              url = url + "&postalcode=" + CGI::escape( @postal_code )
            end
            
            if !@place_name.nil? 
              url = url + "&placename=" + CGI::escape( @place_name )
            end
            
            if !@latitude.nil?
                url = url + "&lat=" + CGI::escape( @latitude.to_s )
            end
            
            if !@longitude.nil?
                url = url + "&lng=" + CGI::escape( @longitude.to_s )
            end

            if !@style.nil?
                url = url + "&style=" + CGI::escape( @style )
            end
            
            if !@country_code.nil? 
              url = url + "&country=" + CGI::escape( @country_code )
            end
            
            if !@max_rows.nil? 
              url = url + "&maxRows=" + CGI::escape( @max_rows.to_s )
            end

            if !@radius.nil? 
              url = url + "&radius=" + CGI::escape( @radius.to_s )
            end
            
            if @is_or_operator 
              url = url + "&operator=OR"
            end
            
            url
        end
    end
end


