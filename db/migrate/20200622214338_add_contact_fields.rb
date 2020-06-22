class AddContactFields < ActiveRecord::Migration[6.0]
  def change
  	change_table :businesses do |t|
  		t.string :email
  	end

  	change_table :people do |t|
  		t.string :email
  		t.string :phone
  		t.string :phone_ext
  	end
  end
end
