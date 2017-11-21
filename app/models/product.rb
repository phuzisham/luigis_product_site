class Product < ApplicationRecord
  has_many :reviews
  # acts_as_votable
  validates :title, :presence => true
  validates :country, :presence => true
  validates :cost, :presence => true

  scope :featured, -> {
    order('reviews_count DESC')
  }

  scope :topThree, -> {
    order('created_at DESC')
  }

  scope :search, -> (search_parameter) {
    where("lower(country) like lower(?) OR lower(title) like lower(?)", "%#{search_parameter}%", "%#{search_parameter}%")
  }
end
