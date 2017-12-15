require 'spec_helper'

describe 'fixer' do

  before(:each) do
    @file = JSON.parse(HTTParty::get('http://api.fixer.io/latest').body)
  end

  it 'Should be a Hash' do
    expect(@file).to be_kind_of(Hash)
  end

  it "should contain the base as EUR" do
    expect(@file["base"]).to eq "EUR"
  end

  it "Should have a date string" do
    expect(@file["date"]).to be_kind_of(String)
  end


  it "should countain 31 rates" do
    @key_num = 0
    @value_num = 0

    @file["rates"].each do |k,v|
      @key_num += 1
      @value_num += 1
    end

    expect(@key_num).to eq 31
    expect(@value_num).to eq 31
  end

  it "should all rates should be Floats" do
    @file["rates"].each do |k,v|
      expect(v).to be_kind_of(Float)
    end
  end

end
