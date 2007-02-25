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
    class PostalCode
        attr :postal_code
        attr :place_name
        attr :country_code
        attr :latitude
        attr :longitude
        attr :admin_name_1
        attr :admin_code_1
        attr :admin_name_2
        attr :admin_code_2
        attr :distance
        
        attr_writer :postal_code, :place_name, :country_code
        attr_writer :latitude, :longitude, :admin_name_1
        attr_writer :admin_code_1, :admin_name_2, :admin_code_2
        attr_writer :distance
        
    end
end


