class Business < ApplicationRecord
	validates :category, presence: true
  validates :subcategory, presence: true
  validates :business_type, presence: true
  validates :name, presence: true, length: { minimum: 3 }
  validates :address, presence: true
  validates :street, presence: true, length: { minimum: 3 }
  validates :city, presence: true, length: { minimum: 3 }
  validates :state, presence: true
  validates :zip_code, presence: true, length: { is: 5 }, numericality: { only_integer: true, greater_than: 0 }
  validates :phone, presence: true, length: { is: 10 }, numericality: { only_integer: true }
  validates :website, length: { minimum: 5 }
  validates :sqft, numericality: { only_integer: true, greater_than: 0 }
  validates :naics, length: { within: 5..6 }, numericality: { only_integer: true, greater_than: 0 }
end
