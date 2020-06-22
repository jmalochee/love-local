class CreateBusinessesPeopleJoinTable < ActiveRecord::Migration[6.0]
  def change
  	create_join_table(:businesses, :people)
  end
end
