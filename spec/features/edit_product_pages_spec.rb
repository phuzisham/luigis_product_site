require 'rails_helper'

describe "the edit a product process" do
  before(:each) do
    FactoryGirl.create(:product)
    visit '/'
    click_link 'Sign up'
    fill_in 'user_email', :with => 'test@test.com'
    fill_in 'user_password', :with => '123456'
    fill_in 'user_password_confirmation', :with => '123456'
    click_on 'Sign Up'
  end

  it "edits a product" do
    visit '/'
    click_link 'All Products'
    first(:link, "Edit").click
    fill_in 'product_title', :with => 'DuhEdit'
    fill_in 'product_cost', :with => '23'
    fill_in 'product_country', :with => 'Jorn'
    click_on 'Submit'
    expect(page).to have_content 'DuhEdit'
  end

  it "gives error when no title is entered" do
    visit '/'
    click_link 'All Products'
    first(:link, "Edit").click
    fill_in 'product_title', :with => ''
    fill_in 'product_cost', :with => '27'
    fill_in 'product_country', :with => 'Jorhn'
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end
