class Social < ApplicationRecord
  belongs_to :business

  validates :site, null: false
  validates :url, null: false, uniqueness: true
end
