# Geonames Ruby API

Ruby library for [Geonames Web Services](http://www.geonames.org/export/)

Inspired by the Geonames Java Client API library 

http://www.tbcn.ca/geonames

## Installing ruby-geonames

Install from the command line:

    sudo gem install elecnix-ruby-geonames

## Examples

The following exercises several of the Geonames web services, [full list of services](http://www.geonames.org/export/).

**Load the the geonames API**

    require 'geonames'

**get list of places near by longitude/longitude location**

    places_nearby = Geonames::WebService.find_nearby_place_name 43.900120387, -78.882869834
    p places_nearby

**get timezone for longitude/longitude location**

    timezone = Geonames::WebService.timezone 43.900120387, -78.882869834
    p timezone

**get country code for longitude/longitude location**

    country_code = Geonames::WebService.country_code 43.900120387, -78.882869834
    p country_code

**get country sub-division info for longitude/longitude location**

    country_subdivision = Geonames::WebService.country_subdivision 43.900120387, -78.882869834
    p country_subdivision

**get postal codes for a given location**

    postal_code_sc = Geonames::PostalCodeSearchCriteria.new
    postal_code_sc.place_name = "Oshawa"
    postal_codes = Geonames::WebService.postal_code_search postal_code_sc
    p postal_codes

**get nearby postal codes for a place name**

    postal_code_sc = Geonames::PostalCodeSearchCriteria.new
    postal_code_sc.place_name = "Oshawa"
    postal_codes_nearby = Geonames::WebService.find_nearby_postal_codes postal_code_sc
    p postal_codes_nearby

## Commercial Service Support

If you use the commercial service, you should put something like this in your configuration:

    Geonames::username = 'username'
    Geonames::base_url = 'http://ws.geonames.net'

In a Rails application, this would go in the `config/environment.rb` file.

# Contributors

    1. Adam Wisniewski
    2. Nicolas Marchildon (elecnix)

