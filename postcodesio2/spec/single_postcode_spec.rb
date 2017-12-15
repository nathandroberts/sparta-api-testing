require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new.single_postcode_service
      @postcodesio.get_single_postcode('se96rj')
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_status_code_from_body_response).to eq 200
    end

    it "should respond with a hash of results" do
      expect(@postcodesio.get_result).to be_kind_of(Hash)
    end

    it "should return a string for country" do
      expect(@postcodesio.get_result_country).to be_kind_of(String)
    end
    # can also use .or to check for one of multiple test pass conditions eg expext(a).to include(a).or include(b)
    it 'Should only return a valid country' do
      expect(['England','Scotland','Wales','Northern Ireland']).to include(@postcodesio.get_result_country)
    end

    it "should return a string for outcode" do
      expect(@postcodesio.get_result_outcode).to be_a(String)
    end

    it "should return a string that is 2-4 characters long for outcode" do
      expect(@postcodesio.get_result_outcode.length).to be_between(2,4)
    end

  end
end
