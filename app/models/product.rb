class Product < ApplicationRecord
  has_many :reviews
  acts_as_votable
  validates :title, :presence => true
  validates :country, :presence => true
  validates_inclusion_of :rating, in: 1..5
end
