require 'rails_helper'

describe Product do
  it { should have_many :reviews }
  it { should validate_presence_of :title }
  it { should validate_presence_of :country }
end
