class AddAboutToBusinesses < ActiveRecord::Migration[6.0]
  def change
  	add_column :businesses, :about, :text
  end
end
