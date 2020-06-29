class CreateServicings < ActiveRecord::Migration[6.0]
  def change
    create_table :servicings do |t|
      t.string :description
      t.belongs_to :business
      t.belongs_to :service

      t.timestamps
    end
  end
end
