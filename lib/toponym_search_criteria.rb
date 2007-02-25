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
    class ToponymSearchCriteria
    
        attr :q
        attr :country_code
        attr :name
        attr :name_equals
        attr :name_starts_with
        attr :tag
        attr :language
        attr :style
        attr :feature_class
        attr :feature_codes
        attr :admin_code_1
        attr :max_rows
        attr :start_row

        attr_writer :q, :country_code, :name, :name_equals
        attr_writer :name_starts_with, :tag, :language, :style
        attr_writer :feature_class, :feature_codes, :admin_code_1
        attr_writer :max_rows, :start_row
    
    end
end


