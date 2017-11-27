require 'rails_helper'

describe 'the add a product process' do
  before(:each) do
    FactoryGirl.create(:product)
    visit '/'
    click_link 'Sign up'
    fill_in 'user_email', :with => 'test@test.com'
    fill_in 'user_password', :with => '123456'
    fill_in 'user_password_confirmation', :with => '123456'
    click_on 'Sign Up'
  end

  it 'adds a new product' do
    visit '/'
    click_link 'Add Product'
    fill_in 'product_title', :with => 'Fine Beer'
    fill_in 'product_cost', :with => '22'
    fill_in 'product_country', :with => 'Flerb'
    click_on 'Submit'
    expect(page).to have_content 'Product successfully added!'
  end

  it "gives error when no input is entered" do
    visit new_product_path
    click_on 'Submit'
    expect(page).to have_content 'Please fix these errors:'
  end
end
