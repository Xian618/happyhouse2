class DataGovQuery
  require 'net/http'
  require 'nori'
  include AttributeHash
  include HttpParamsGet
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :query

  def initialize(user_query)
    @query=user_query.place_name
  end

  def search
    domain='http://api.talis.com'
    path='/stores/ordnance-survey/items'
    hash=to_hash()
    uri=URI(buildgetrequest(domain, path, hash))
    parser=Nori.new
    return parser.parse(Net::HTTP.get(uri))
  end

  def persisted?
    false
  end
end
