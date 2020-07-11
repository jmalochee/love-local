class Social < ApplicationRecord
  belongs_to :business

  validates :url, null: false, uniqueness: true

  def self.sites
  	[
  		"twitter",
  		"facebook",
  		"instagram",
  		"github",
  		"grubhub",
      "other"
  	]
  end
end
