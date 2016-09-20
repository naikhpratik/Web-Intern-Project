require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "Product", :type => :feature do
  scenario "User creates a valid product" do
    visit new_product_url

    fill_in 'Name', :with => "My Widget"
    click_button "Create"
    expect(page).to have_text("Product was successfully created.")
  end

  scenario "User creates a duplicate product" do
    product = FactoryGirl.create(:product, name: "My Widget")
    
    visit new_product_url
    
    fill_in "Name", :with => "My Widget"
    click_button "Create"
    expect(page).to have_content("Name has already been taken")
  end

  scenario "User creates a invalid product" do
    visit new_product_url

    fill_in "Name", :with => ""
    click_button "Create"
    expect(page).to have_content("Name can't be blank")
  end

  # scenario "Show"

end
