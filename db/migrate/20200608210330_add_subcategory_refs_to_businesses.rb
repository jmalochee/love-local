class AddSubcategoryRefsToBusinesses < ActiveRecord::Migration[6.0]
  def change
    change_table :businesses do |t|
      t.belongs_to :subcategory, foreign_key: true
    end
  end
end