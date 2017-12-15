require "httparty"
require "json"

class SinglePostcodeService
  include HTTParty

  attr_accessor :single_postcode_data

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    @single_postcode_data = JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_result
    @single_postcode_data['result']
  end

  def get_status_code_from_body_response
    @single_postcode_data['status']
  end

  def get_result_postcode
    get_result['postcode']
  end
  def get_result_quality
    get_result['quality']
  end
  def get_result_eastings
    get_result['eastings']
  end
  def get_result_northings
    get_result['northings']
  end
  def get_result_country
    get_result['country']
  end
  def get_result_nhs_sa
    get_result['nhs_sa']
  end
  def get_result_longitude
    get_result['longitude']
  end
  def get_result_latitude
    get_result['latitude']
  end
  def get_result_european_electoral_region
    get_result['european_electoral_region']
  end
  def get_result_primary_care_trust
    get_result['primary_care_trust']
  end
  def get_result_region
    get_result['region']
  end
  def get_result_lsoa
    get_result['lsoa']
  end
  def get_result_msoa
    get_result['msoa']
  end
  def get_result_incode
    get_result['incode']
  end
  def get_result_outcode
    get_result['outcode']
  end



end
