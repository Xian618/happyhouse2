class NestoriaQuery
  require 'json'
  require 'net/http'
  include HttpParamsGet
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :encoding, :listing_type, :place_name, :price_min, :price_max, :bedroom_min, :bedroom_max, :has_photo,
                :number_of_results, :page, :country, :pretty, :action

  def initialize(query)
  	@encoding='json'
  	@place_name=query.place_name
  	@price_min=query.price_min
  	@price_max=query.price_max
  	@bedroom_min=query.bedroom_min
  	@bedroom_max=query.bedroom_max
  	@has_photo,=1
  	@number_of_results=20
  	@page=1
    @country='uk'
    @pretty=1
    @action='search_listings'
  end

  def search
    domain='http://api.nestoria.co.uk'
    path='/api'
    hash=to_hash()
    uri = URI(buildgetrequest(domain, path, hash))
    result = JSON.parse(Net::HTTP.get(uri))
  end

  def to_hash
    hash = {}; 
    self.instance_variables.each { |k|
      hash[k] = instance_variable_get(k)
    }
    return hash
  end

  def persisted?
    false
  end

end