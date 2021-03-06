class NestoriaQuery
  require 'json'
  require 'net/http'
  include AttributeHash
  include HttpParamsGet
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :encoding, :listing_type, :place_name, :price_min, :price_max, :bedroom_min, :bedroom_max, :has_photo,
                :number_of_results, :page, :country, :pretty, :action, :listing_type, :total_pages

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
    @listing_type='rent'
    @total_pages=1
  end

  def search
    domain='http://api.nestoria.co.uk'
    path='/api'
    hash=to_hash()
    uri = URI(buildgetrequest(domain, path, hash))
    return JSON.parse(Net::HTTP.get(uri))
  end

  def persisted?
    return false
  end

end