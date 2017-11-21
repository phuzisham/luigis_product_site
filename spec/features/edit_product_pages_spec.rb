require 'rails_helper'

describe "the edit a product process" do
  it "edits a product" do
    prod1 = Product.create(:title => "Duh1", :cost => "11", :country => "Flerb")
    prod2 = Product.create(:title => "Duh2", :cost => "12", :country => "Klerb")
    prod3 = Product.create(:title => "Duh3", :cost => "13", :country => "Tlerb")
    visit '/'
    click_link 'All Products'
    first(:link, "Edit").click
    fill_in 'product_title', :with => 'DuhEdit'
    fill_in 'product_cost', :with => '23'
    fill_in 'product_country', :with => 'Jorn'
    click_on 'Update Product'
    expect(page).to have_content 'DuhEdit'
  end

  it "gives error when no title is entered" do
    prod1 = Product.create(:title => "Duh1", :cost => "11", :country => "Flerb")
    prod2 = Product.create(:title => "Duh2", :cost => "12", :country => "Klerb")
    prod3 = Product.create(:title => "Duh3", :cost => "13", :country => "Tlerb")
    visit '/'
    click_link 'All Products'
    first(:link, "Edit").click
    fill_in 'product_title', :with => ''
    fill_in 'product_cost', :with => '27'
    fill_in 'product_country', :with => 'Jorhn'
    click_on 'Update Product'
    expect(page).to have_content 'errors'
  end
end
