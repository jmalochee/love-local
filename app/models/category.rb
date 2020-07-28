class Category < ApplicationRecord
	has_many :subcategories
	has_many :businesses, through: :subcategories
	
	validates :name, presence: true, uniqueness: true
end