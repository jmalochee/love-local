class CreateBusinessesServicesJoinTable < ActiveRecord::Migration[6.0]
  def change
  	create_join_table :businesses, :services do |t|
      t.index :business_id
      t.index :service_id
      t.text :notes
    end
  end
end
