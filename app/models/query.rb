class Query
  include ActiveModel::Validations
  include ActiveModel::Conversion
  #extend ActiveModel::Naming

  attr_accessor :bedroom_max, :bedroom_min, :place_name, :price_max, :price_min

  def persisted?
    false
  end
end
