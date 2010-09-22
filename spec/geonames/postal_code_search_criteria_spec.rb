require 'spec_helper'

module Geonames
  describe PostalCodeSearchCriteria do
    describe "#to_query_params_string" do
      context "with latitude" do
        let(:latitude) { 25.123 }
        before(:each) { subject.latitude = latitude }
        it("contains the lat parameter") { subject.to_query_params_string.should =~ /lat=#{latitude}/ }
      end

      context "with longitude" do
        let(:longitude) { -52.123 }
        before(:each) { subject.longitude = longitude }
        it("contains the lng parameter") { subject.to_query_params_string.should =~ /lng=#{longitude}/ }
      end

      context "with a style" do
        let(:style) { "SHORT" }
        before(:each) { subject.style = style }
        it("contains the style parameter") { subject.to_query_params_string.should =~ /style=#{style}/ }
      end
    end
  end
end
