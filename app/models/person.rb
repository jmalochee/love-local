class Person < ApplicationRecord
	has_and_belongs_to_many :businesses
	
	validates :first_name, presence: true
	validates :last_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :phone, presence: true, length: { is: 10 }, numericality: { only_integer: true }
  validates :phone_ext, numericality: { only_integer: true }
end
