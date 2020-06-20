class Service < ApplicationRecord
	validates :code, presence: true
	validates :name, presence: true
	has_and_belongs_to_many :businesses
end
