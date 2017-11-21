require 'rails_helper'

describe 'the add a product process' do
  it 'adds a new product' do
    prod1 = Product.create(:title => "Duh1", :cost => "11", :country => "Flerb")
    prod2 = Product.create(:title => "Duh2", :cost => "12", :country => "Klerb")
    prod3 = Product.create(:title => "Duh3", :cost => "13", :country => "Tlerb")
    visit '/'
    click_link 'Add Product'
    fill_in 'product_title', :with => 'Fine Beer'
    fill_in 'product_cost', :with => '22'
    fill_in 'product_country', :with => 'Flerb'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
  end

  it "gives error when no input is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'Please fix these errors:'
  end
end
