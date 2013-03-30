class NestoriaQuery
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :encoding, :listing_type, :place_name, :price_min, :price_max, :bedroom_min, :bedroom_max, :has_photo,
                :number_of_results, :page

  def persisted?
    false
  end
end