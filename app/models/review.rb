class Review < ApplicationRecord
  belongs_to :product, counter_cache: true
  validates :author, :presence => true
  validates :content, :presence => true
  validates_inclusion_of :rating, in: 1..5
  validates_length_of :content, :within => 50..250
end
