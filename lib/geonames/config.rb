#=============================================================================
#
# Copyright 2010 Jan Schwenzien <jan@schwenzien.info> 
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
  class Config

    attr_reader :password

    @@default_username  = nil
    @@default_base_url  = "http://ws.geonames.org"
    @@default_lang      = "en"

    def username
      @username || @@default_username
    end

    def username=(username)
      @username = username
    end

    def password=(password)
      @password = password
    end

    def base_url
      @base_url || @@default_base_url
    end

    def base_url=(base_url)
      @base_url = base_url
    end

    def lang
      @lang || @@default_lang
    end

    def lang=(lang)
      @lang = lang
    end

  end
end
