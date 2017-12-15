require 'spec_helper'

describe Postcodesio do

  before(:each) do
    @p = Postcodesio.new
  end

  it 'Should be a Hash (single input)' do
    expect(@p.get_single_postcode("tw89lb")).to be_kind_of(Hash)
    expect(@p.get_multiple_postcodes(["b601ja", "tw89lb"])).to be_kind_of(Hash)
  end

  it 'Should be a Hash (multiple inputs)' do
    expect(@p.get_multiple_postcodes(["b601ja", "tw89lb"])).to be_kind_of(Hash)
  end

  it 'Should recognise invalid postcodes (single input)' do
    expect(@p.get_single_postcode("1234")["status"]).to eq(404)
  end

  it 'Should return a postcode that is between 6 and 8 characters long (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['postcode'].length).to be_between(6,8)
  end

  it 'Should return a postcode that is between 6 and 8 characters long (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['postcode'].length).to be_between(6,8)
    end
  end

  it 'Should return strings for postcode (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['postcode']).to be_a(String)
  end

  it 'Should return strings for postcode (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['postcode']).to be_a(String)
    end
  end

  it 'Should return integer for quality (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['quality']).to be_a(Integer)
  end

  it 'Should return integer for quality (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['quality']).to be_a(Integer)
    end
  end

  it 'Should return strings for country (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['country']).to be_a(String)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['country']).to be_a(String)
    end
  end

  it 'Should return strings for country (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['country']).to be_a(String)
    end
  end

  it 'Should only return a valid country (single input)' do
    # single input
    expect(@p.get_single_postcode("b601ja")["result"]['country']).to include('England')
  end

  it 'Should only return a valid country (multiple inputs)' do
    # multiple inputs
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(['England','Scotland','Wales','Northern Ireland']).to include(input['result']['country'])
    end
    # fufil one of a list of multiple conditions or automatically fail second way to solve
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      if input['result']['country'].include? 'Scotland'
        expect(input['result']['country']).to include('Scotland')
      elsif input['result']['country'].include? 'Wales'
        expect(input['result']['country']).to include('Wales')
      elsif input['result']['country'].include? 'Northern Ireland'
        expect(input['result']['country']).to include('Northern Ireland')
      elsif input['result']['country'].include? 'England'
        expect(input['result']['country']).to include('England'),  "Expected either England, Scotland, Wales or Northern Ireland. Instead recieved: #{input['result']['country']}"
      # auto fail
      else
        fail
      end
    end
  end


  it 'Should return strings for nhs_ha (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['nhs_ha']).to be_a(String)
  end

  it 'Should return strings for nhs_ha (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['nhs_ha']).to be_a(String)
    end
  end

  it 'Should return strings for european_electoral_region (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['european_electoral_region']).to be_a(String)
  end

  it 'Should return strings for european_electoral_region (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['european_electoral_region']).to be_a(String)
    end
  end

  it 'Should return strings for primary_care_trust (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['primary_care_trust']).to be_a(String)
  end

  it 'Should return strings for primary_care_trust (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['primary_care_trust']).to be_a(String)
    end
  end

  it 'Should return strings for lsoa (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['lsoa']).to be_a(String)
  end

  it 'Should return strings for lsoa (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['lsoa']).to be_a(String)
    end
  end

  it 'Should return strings for msoa (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['msoa']).to be_a(String)
  end

  it 'Should return strings for msoa (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['msoa']).to be_a(String)
    end
  end

  it 'Should return strings for incode (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['incode']).to be_a(String)
  end

  it 'Should return strings for incode (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['incode']).to be_a(String)
    end
  end

  it 'Should return 3 character long incode (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['incode'].length).to eq(3)
  end

  it 'Should return 3 character long incode (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['incode'].length).to eq(3)
    end
  end

  it 'Should return strings for outcode (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['outcode']).to be_a(String)
  end

  it 'Should return strings for outcode (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['outcode']).to be_a(String)
    end
  end

  it 'Should return 2-4 character long outcode (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['outcode'].length).to be_between(2, 4)
  end

  it 'Should return 2-4 character long outcode (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['outcode'].length).to be_between(2, 4)
    end
  end

  it 'Should return strings for region (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['region']).to be_a(String)
  end

  it 'Should return strings for region (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['region']).to be_a(String)
    end
  end

  it 'Should return strings for parliamentary_constituency (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['parliamentary_constituency']).to be_a(String)
  end

  it 'Should return strings for parliamentary_constituency (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['parliamentary_constituency']).to be_a(String)
    end
  end

  it 'Should return strings for admin_district (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['admin_district']).to be_a(String)
  end

  it 'Should return strings for admin_district (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['admin_district']).to be_a(String)
    end
  end

  it 'Should return strings for parish (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['parish']).to be_a(String)
  end

  it 'Should return strings for parish (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['parish']).to be_a(String)
    end
  end

  it 'Should return strings or nil for admin_county (single input)' do
    expect(@p.get_single_postcode("b601ja")["result"]['admin_county']).to be_a(String)
  end

  it 'Should return strings or nil for admin_county (multiple inputs)' do
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      if input['result']['admin_county'] != nil
        expect(input['result']['admin_county']).to be_a(String)
      end
    end
  end

  it 'Should return strings for admin_ward' do
    expect(@p.get_single_postcode("b601ja")["result"]['admin_ward']).to be_a(String)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['admin_ward']).to be_a(String)
    end
  end

  it 'Should return strings for ccg' do
    expect(@p.get_single_postcode("b601ja")["result"]['ccg']).to be_a(String)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['ccg']).to be_a(String)
    end
  end

  it 'Should return strings for nuts' do
    expect(@p.get_single_postcode("b601ja")["result"]['nuts']).to be_a(String)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['nuts']).to be_a(String)
    end
  end

  it 'Should return a float for longitude' do
    expect(@p.get_single_postcode("b601ja")["result"]['longitude']).to be_a(Float)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['longitude']).to be_a(Float)
    end
  end

  it 'Should return a float for latitude' do
    expect(@p.get_single_postcode("b601ja")["result"]['latitude']).to be_a(Float)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['latitude']).to be_a(Float)
    end
  end

  it 'Should return an integer for eastings' do
    expect(@p.get_single_postcode("b601ja")["result"]['eastings']).to be_a(Integer)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['eastings']).to be_a(Integer)
    end
  end

  it 'Should return an integer for northings' do
    expect(@p.get_single_postcode("b601ja")["result"]['northings']).to be_a(Integer)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['northings']).to be_a(Integer)
    end
  end

  it 'Should return strings for the code admin_district' do
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['admin_district']).to be_a(String)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['codes']['admin_district']).to be_a(String)
    end
  end

  it 'Strings returned for the code admin_district should be 9 characters long and begin with E' do
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['admin_district'].length).to eq(9)
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['admin_district'][0]).to eq('E')
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['codes']['admin_district'].length).to eq(9)
      expect(input['result']['codes']['admin_district'][0]).to eq('E')
    end
  end

  it 'Should return strings for the code admin_county' do
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['admin_county']).to be_a(String)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['codes']['admin_county']).to be_a(String)
    end
  end

  it 'Strings returned for the code admin_county should be 9 characters long and begin with E' do
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['admin_county'].length).to eq(9)
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['admin_county'][0]).to eq('E')
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['codes']['admin_county'].length).to eq(9)
      expect(input['result']['codes']['admin_county'][0]).to eq('E')
    end
  end

  it 'Should return strings for the code admin_ward' do
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['admin_ward']).to be_a(String)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['codes']['admin_ward']).to be_a(String)
    end
  end

  it 'Strings returned for the code admin_ward should be 9 characters long and begin with E' do
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['admin_ward'].length).to eq(9)
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['admin_ward'][0]).to eq('E')
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['codes']['admin_ward'].length).to eq(9)
      expect(input['result']['codes']['admin_ward'][0]).to eq('E')
    end
  end

  it 'Should return strings for the code parish' do
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['parish']).to be_a(String)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['codes']['parish']).to be_a(String)
    end
  end

  it 'Strings returned for the code parish should be 9 characters long and begin with E' do
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['parish'].length).to eq(9)
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['parish'][0]).to eq('E')
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['codes']['parish'].length).to eq(9)
      expect(input['result']['codes']['parish'][0]).to eq('E')
    end
  end

  it 'Should return strings for the code parliamentary_constituency' do
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['parliamentary_constituency']).to be_a(String)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['codes']['parliamentary_constituency']).to be_a(String)
    end
  end

  it 'Strings returned for the code parliamentary_constituency should be 9 characters long and begin with E' do
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['parliamentary_constituency'].length).to eq(9)
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['parliamentary_constituency'][0]).to eq('E')
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['codes']['parliamentary_constituency'].length).to eq(9)
      expect(input['result']['codes']['parliamentary_constituency'][0]).to eq('E')
    end
  end

  it 'Should return strings for the code ccg' do
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['ccg']).to be_a(String)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['codes']['ccg']).to be_a(String)
    end
  end

  it 'Strings returned for the code ccg should be 9 characters long and begin with E' do
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['ccg'].length).to eq(9)
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['ccg'][0]).to eq('E')
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['codes']['ccg'].length).to eq(9)
      expect(input['result']['codes']['ccg'][0]).to eq('E')
    end
  end

  it 'Should return strings for the code nuts' do
    expect(@p.get_single_postcode("b601ja")["result"]['codes']['nuts']).to be_a(String)
    @p.get_multiple_postcodes(["tw89lb", "b601ja"])['result'].each do |input|
      expect(input['result']['codes']['nuts']).to be_a(String)
    end
  end


end
