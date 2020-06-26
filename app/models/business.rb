class Business < ApplicationRecord
  validates :category, presence: true, allow_blank: false
  validates :category, presence: true, allow_blank: false
  validates :name, presence: true, length: { minimum: 3 }
  validates :about, length: { maximum: 250 }
  validates :address, presence: true
  validates :street, presence: true, length: { minimum: 3 }
  validates :city, presence: true, length: { minimum: 3 }
  validates :state, presence: true
  validates :zip_code, presence: true, length: { is: 5 }, numericality: { only_integer: true, greater_than: 0 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, allow_blank: true
  validates :phone, presence: true, length: { is: 10 }, numericality: { only_integer: true }
  validates :phone_ext, numericality: { only_integer: true }, allow_blank: true
  validates :website, length: { minimum: 5 }, allow_blank: true
  validates :sqft, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :naics, length: { within: 5..6 }, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :su_open, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :su_close, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :mo_open, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :mo_close, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :tu_open, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :tu_close, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :we_open, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :we_close, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :th_open, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :th_close, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :fr_open, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :fr_close, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :sa_open, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  validates :sa_close, allow_blank: true, format: { with: /\d{3,4}/, message: "Time must be in HHMM format"}
  has_and_belongs_to_many :services
  has_and_belongs_to_many :people
  has_many :socials
  accepts_nested_attributes_for :people, :socials

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

  def open_now?
    now = Time.new
    (now.hour*100 + now.min).between?(self.hours_today[0].to_i, self.hours_today[1].to_i)
  end

  def open_today
    today = Time.new.strftime('%a')[0..1].downcase    
    [self[today + "_open"], self[today + "_close"]]
  end

  def category_url
    "/businesses?"+{filter: {attribute: "category", value: self.category}}.to_query
  end  

  def subcategory_url
    "/businesses?"+{filter: {attribute: "subcategory", value: self.subcategory}}.to_query
  end

  def self.all_cats
    cats = []
    Business.select(:category).distinct.each {|cat| cats.push(cat.category)}
    cats
  end

  def self.all_subs
    subs = []
    Business.select(:subcategory).distinct.each {|sub| subs.push(sub.subcategory)}
    subs
  end

  def self.all_subcats
    subcats = {}
    all_cats.each do |cat|
      subcats[cat] = []
      Business.where({category: cat}).select(:subcategory).distinct.each { |sub| subcats[cat] << sub.subcategory }
    end
    subcats
  end
end





