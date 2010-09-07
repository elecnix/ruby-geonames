# Geonames Ruby API

Ruby library for [Geonames Web Services](http://www.geonames.org/export/)

Created by [TouchBase Counsulting](http://www.tbcn.ca/geonames) to support GIS processes for [Carpool Connect](http://www.carpoolconnect.com/). Inspired by the Geonames [Java Client API library](http://www.geonames.org/source-code/).

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

outputs:

`[#<Geonames::Toponym:0x6c8c98 @population=nil, @geoname_id='6094578', @longitude=-78.849568878, @feature_class_name=nil, @country_name='Canada', @latitude=43.900120387, @feature_class='P', @country_code='CA', @name='Oshawa', @feature_code_name=nil, @elevation=nil, @distance=2.6679930307932, @alternate_names=nil, @feature_code='PPL'>]`

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

## Language Support

Geonames uses 'en' as the default locale. You can change the requested language like this:

    Geonames::lang = 'de'

In a Rails application, you could set the language from the I18n.locale:

    Geonames::lang = I18n.locale

## Commercial Service Support

If you use the commercial service, you should put something like this in your configuration:

    Geonames::username = 'username'
    Geonames::base_url = 'http://ws.geonames.net'

In a Rails application, this could go into `config/initializers/geonames.rb`.

# Contributors

    1. Adam Wisniewski
    2. Nicolas Marchildon (elecnix)

