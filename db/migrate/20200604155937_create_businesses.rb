class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :business_type
      t.string :name
      t.string :address
      t.string :street
      t.string :unit
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :website
      t.integer :sqft
      t.text :description
      t.string :naics
      t.string :women
      t.string :minority
      t.string :black

      t.timestamps
    end
  end
end
