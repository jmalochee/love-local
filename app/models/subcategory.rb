class Subcategory < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	belongs_to :category
	has_many :businesses
end