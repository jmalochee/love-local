class AddHoursToBusinesses < ActiveRecord::Migration[6.0]
  def change
  	change_table :businesses do |t|
  		t.string :su_open
  		t.string :su_close
  		t.string :mo_open
  		t.string :mo_close
  		t.string :tu_open
  		t.string :tu_close
  		t.string :we_open
  		t.string :we_close
  		t.string :th_open
  		t.string :th_close
  		t.string :fr_open
  		t.string :fr_close
  		t.string :sa_open
  		t.string :sa_close
  	end
  end
end
