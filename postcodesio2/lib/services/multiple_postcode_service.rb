require "httparty"
require "json"

class MultiPostcodesService
  include HTTParty

  base_uri 'https://api.postcodes.io'

  attr_accessor :multiple_postcodes_data

  def get_multiple_postcodes(postcodes_array)
    @multiple_postcodes_data = JSON.parse(self.class.post("/postcodes", body: {"postcodes"=> postcodes_array}).body)
  end

  def get_result
    @multiple_postcodes_data['result']
  end

  def get_result_postcode
    get_result['postcode']
  end

  def get_postcodes(data)
    data['result']['postcode']
  end

end
