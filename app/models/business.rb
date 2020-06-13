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
  validates :su_open, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :su_close, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :mo_open, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :mo_close, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :tu_open, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :tu_close, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :we_open, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :we_close, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :th_open, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :th_close, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :fr_open, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :fr_close, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :sa_open, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :sa_close, allow_nil: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}

  def self.search(search)
    if search
      where(category: search)
    else
      default_scoped
    end
  end

  def open_today?
    today = Time.new.strftime('%a')[0..1].downcase
    if self[today + "_open"]
      true
    else
      false
    end
  end

  def open_now?
    now = Time.new
    (now.hour*100 + now.min).between?(self.hours_today[0].to_i, self.hours_today[1].to_i)
  end

  def open_today
    today = Time.new.strftime('%a')[0..1].downcase    
    [self[today + "_open"], self[today + "_close"]]
  end
end





