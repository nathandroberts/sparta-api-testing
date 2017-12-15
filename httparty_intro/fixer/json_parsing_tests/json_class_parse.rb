require 'json'

class ParseJson

  attr_accessor :json_file

  def initialize(json_file)
    @json_file = JSON.parse(File.read(json_file))
  end

  def get_base
    @json_file['base']
  end

  def get_date_length
    @json_file['date'].length
  end

  def get_rates
    @json_file['rates']
  end

end
