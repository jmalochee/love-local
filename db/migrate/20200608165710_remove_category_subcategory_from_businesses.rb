class RemoveCategorySubcategoryFromBusinesses < ActiveRecord::Migration[6.0]
  def change
  	remove_column :businesses, :category, :string
  	remove_column :businesses, :subcategory, :string
  end
end
