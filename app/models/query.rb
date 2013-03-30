class Query
  
  include HashConstruction
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :bedroom_max, :bedroom_min, :place_name, :price_max, :price_min

  validates_presence_of :place_name

  def persisted?
    false
  end
end
