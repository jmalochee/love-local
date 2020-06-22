class CreateBusinessesServicesJoinTable < ActiveRecord::Migration[6.0]
  def change
  	create_join_table(:businesses, :services)
  end
end
