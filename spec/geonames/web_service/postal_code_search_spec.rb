require 'spec_helper'

module Geonames
  describe WebService do
    describe ".postal_code_search" do
      subject { Geonames::WebService.postal_code_search(criteria) }

      context "lookup by latitude and longitude" do
        let(:criteria) do
          criteria = Geonames::PostalCodeSearchCriteria.new
          criteria.latitude  = 47
          criteria.longitude = 9
          criteria
        end

        before(:each) do
          FakeWeb.register_uri(:get, /\/postalCodeSearch\?.*&lat=47.*&lng=9/, :response => File.read(
            File.join(File.dirname(__FILE__), '..', '..', 'fixtures', 'find_nearby_postal_codes', 'lat_lng.xml.http')
          ))
        end

        it { should be_a_kind_of(Array) }

        it "returns PostalCode instances" do
          subject.each do |postal_code|
            postal_code.should be_a_kind_of PostalCode
          end
        end
      end
    end
  end
end
