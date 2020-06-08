class Business < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :about, length: { maximum: 250 }
  validates :address, presence: true
  validates :street, presence: true, length: { minimum: 3 }
  validates :city, presence: true, length: { minimum: 3 }
  validates :state, presence: true
  validates :zip_code, presence: true, length: { is: 5 }, numericality: { only_integer: true, greater_than: 0 }
  validates :phone, presence: true, length: { is: 10 }, numericality: { only_integer: true }
  validates :website, length: { minimum: 5 }, allow_nil: true
  validates :sqft, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :naics, length: { within: 5..6 }, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  belongs_to :subcategory
  has_one :category, through: :subcategory
end
