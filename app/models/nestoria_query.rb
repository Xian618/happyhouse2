class NestoriaQuery < ActiveRecord::Base
  attr_accessible :bedroom_max, :bedroom_min, :encoding, :has_photo, :listing_type, :number_of_results, :page, :place_name, :price_max, :price_min
end
