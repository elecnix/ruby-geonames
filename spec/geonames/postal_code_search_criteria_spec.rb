require 'spec_helper'

module Geonames
  describe PostalCodeSearchCriteria do
    describe "#to_query_params_string" do
      context "with a numeric latitude" do
        let(:latitude) { 25.123 }
        before(:each) { subject.latitude = latitude }
        it("contains the lat parameter") { subject.to_query_params_string.should =~ /lat=#{latitude}/ }
      end

      context "with a numeric longitude" do
        let(:longitude) { -52.123 }
        before(:each) { subject.longitude = longitude }
        it("contains the lng parameter") { subject.to_query_params_string.should =~ /lng=#{longitude}/ }
      end

      context "with a numeric max_rows" do
        let(:max_rows) { 1 }
        before(:each) { subject.max_rows = max_rows }
        it("contains the maxRows parameter") { subject.to_query_params_string.should =~ /maxRows=#{max_rows}/ }
      end

      context "with a style" do
        let(:style) { "SHORT" }
        before(:each) { subject.style = style }
        it("contains the style parameter") { subject.to_query_params_string.should =~ /style=#{style}/ }
      end
    end
  end
end
