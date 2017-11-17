class Review < ApplicationRecord
  belongs_to :product
  validates :author, :presence => true
  validates :content, :presence => true
  validates_inclusion_of :rating, in: 1..5
end
