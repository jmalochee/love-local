class Subcategory < ApplicationRecord
	belongs_to :category
	has_many :businesses
	
	validates :name, presence: true, uniqueness: true
end