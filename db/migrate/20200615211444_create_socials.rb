class CreateSocials < ActiveRecord::Migration[6.0]
  def change
    create_table :socials do |t|
      t.string :site
      t.string :url
      t.belongs_to :business, null: false, foreign_key: true
    end
  end
end
