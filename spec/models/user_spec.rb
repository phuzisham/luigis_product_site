require 'rails_helper'

describe User do
  it { validate_confirmation_of :password }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
end
