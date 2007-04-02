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
  class WikipediaArticle

    attr :language
    attr :title
    attr :summary
    attr :wikipedia_url
    attr :feature
    attr :population
    attr :elevation
    attr :latitude
    attr :longitude
    attr :thumbnail_img
    attr :distance

    attr_writer :language, :title, :summary
    attr_writer :wikipedia_url, :feature, :population
    attr_writer :elevation, :latitude, :longitude
    attr_writer :thumbnail_img, :distance

  end
end


