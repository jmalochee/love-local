class Category < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	has_many :subcategories
	has_many :businesses, through: :subcategories
end