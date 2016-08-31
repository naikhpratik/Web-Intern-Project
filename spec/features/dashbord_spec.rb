require 'rails_helper'
require 'capybara/rspec'
RSpec.feature "Products", :type => :feature do


  scenario "Expect page to have all products" do
    visit "/products/new"
    fill_in 'Name', :with => "My Widget"
    click_button "Create"
    visit "/dashboard/dashboard"
    #skip()
    expect(page).to have_text("My Widget")
  end

  scenario "Expect page to have products related to users" do
    visit "/dashboard/dashboard"
    skip()
    expect(page).to have_text("Product was successfully created.")
  end

end
