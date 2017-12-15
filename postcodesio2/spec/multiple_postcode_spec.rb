require 'spec_helper'

describe Postcodesio do

  context 'requesting information on multiple postcodes works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new.multiple_postcode_service
      @postcodesio.get_multiple_postcodes(['se96rj', 'tw89lb'])
    end

    it "should be a hash" do
      expect(@postcodesio.get_multiple_postcodes(["b601ja", "tw89lb"])).to be_kind_of(Hash)
    end

    it 'Should return strings for postcode (multiple inputs)' do
      @postcodesio.get_result.each do |input|
        expect(@postcodesio.get_postcodes(input)).to be_a(String), "data returned #{@postcodesio.get_postcodes(input)}"
      end
    end

    # it 'Should return strings for postcode (multiple inputs)' do
    #   @postcodesio.get_result.each do |input|
    #     expect(input['postcode']).to be_a(Integer), "data returned #{input['postcode']}"
    #   end
    # end







  end
end
