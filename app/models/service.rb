class Service < ApplicationRecord
	has_many :servicings
	has_many :businesses, through: :servicings

	validates :name, presence: true, uniqueness: true
end
