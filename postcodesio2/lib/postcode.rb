
require_relative 'services/single_postcode_service'
require_relative 'services/multiple_postcode_service'

class Postcodesio
  def single_postcode_service
    SinglePostcodeService.new
  end

  def multiple_postcode_service
    MultiPostcodesService.new
  end
end

# x = Postcodesio.new
# x.multiple_postcode_service.get_multiple_postcodes(['tw89lb', 'b601ja'])
# x.single_postcode_service.get_single_postcode('b601ja')
# x.single_postcode_service.get_single_postcode('b601ja')
