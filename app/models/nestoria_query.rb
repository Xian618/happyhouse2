class NestoriaQuery
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

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
    Rails.logger.debug("hash follows:")
    Rails.logger.debug(hash)
    Rails.logger.debug("hash ends")
    return http_get(domain, path, hash)




	#url_string='http://api.nestoria.co.uk/api?country=uk&pretty=1&action=search_listings'
	#url_string << '&encoding=' << @encoding

	#url = URI.parse('http://<site_name>/accounts/1.json')
	#req = Net::HTTP::Get.new(url.path)
	#res = Net::HTTP.start(url.host, url.port) {|http|
	#  http.request(req)
	#}
	#
	#@output = JSON(res.body)["account"]

  end

  def to_hash
    hash = {}; 
    self.instance_variables.each { |k,v| hash[k] = v }
    return hash
  end

  def http_get(domain,path,params)
    path_section="#{path}?"

    all_params=params.collect { |k,v| 
      "#{k}=#{CGI::escape(v.to_s)}".delete "@"
    }

    joined_params=all_params.join('&')

    return path_section.concat(joined_params)

    #return Net::HTTP.get(domain, "#{path}?".concat(params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&'))) if not params.nil?
    #return Net::HTTP.get(domain, path)
  end  

  def persisted?
    false
  end

end