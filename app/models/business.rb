class Business < ApplicationRecord
  belongs_to :subcategory
  has_one :category, through: :subcategory
  has_many :servicings
  has_many :services, through: :servicings
  has_and_belongs_to_many :people
  has_many :socials
  accepts_nested_attributes_for :people, :socials

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :about, length: { maximum: 250 }
  validates :address, presence: true
  validates :street, presence: true, length: { minimum: 3 }
  validates :city, presence: true, length: { minimum: 3 }
  validates :state, presence: true
  validates :zip_code, presence: true, length: { is: 5 }, numericality: { only_integer: true, greater_than: 0 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, allow_blank: true, uniqueness: true
  validates :phone, length: { is: 10 }, numericality: { only_integer: true }
  validates :phone_ext, numericality: { only_integer: true }, allow_blank: true
  validates :website, length: { minimum: 5 }, allow_blank: true
  validates :sqft, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :naics, length: { within: 5..6 }, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :su_open, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}
  validates :su_close, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}
  validates :mo_open, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}
  validates :mo_close, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}
  validates :tu_open, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}
  validates :tu_close, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}
  validates :we_open, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}
  validates :we_close, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}
  validates :th_open, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}
  validates :th_close, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}
  validates :fr_open, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}
  validates :fr_close, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}
  validates :sa_open, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}
  validates :sa_close, allow_blank: true, format: { with: /\d{1,2}:\d{2}/, message: "Time must be in HH:MM format"}

  def self.filter(filter)
    if filter
      where(filter[:attribute] => filter[:value])
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

  def open_today
    today = Time.new.strftime('%a')[0..1].downcase    
    [self[today + "_open"], self[today + "_close"]]
  end

  def open_now?
    now = Time.new
    (now.hour*100 + now.min).between?(
      self.open_today[0].gsub(":","").to_i, 
      self.open_today[1].gsub(":","").to_i
    )
  end

  def closes_in
    now = Time.now
    now = now.hour * 100 + now.min
    self.open_today[1].gsub(":","").to_i - now
  end
end





