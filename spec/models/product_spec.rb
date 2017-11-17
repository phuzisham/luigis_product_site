require 'rails_helper'

describe Album do
  it { should validate_presence_of :title}
  it { should validate_presence_of :artist_id}
  it { should belong_to :artist }
  it { should have_many :reviews }
end
