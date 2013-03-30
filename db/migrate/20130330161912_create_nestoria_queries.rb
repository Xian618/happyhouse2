class CreateNestoriaQueries < ActiveRecord::Migration
  def change
    create_table :nestoria_queries do |t|
      t.string :encoding
      t.string :listing_type
      t.string :place_name
      t.integer :price_min
      t.integer :price_max
      t.integer :bedroom_min
      t.integer :bedroom_max
      t.boolean :has_photo
      t.integer :number_of_results
      t.integer :page

      t.timestamps
    end
  end
end
