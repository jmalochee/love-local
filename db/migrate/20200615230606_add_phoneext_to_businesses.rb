class AddPhoneextToBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :phone_ext, :string
  end
end
