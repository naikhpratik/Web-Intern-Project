require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "Create Product", :type => :feature do
  scenario "User creates a valid product" do
    visit "/products/new"

    fill_in 'Name', :with => "My Widget"
    click_button "Create"
    expect(page).to have_text("Product was successfully created.")
  end

  scenario "User creates a duplicate product" do
    visit "/products/new"

    fill_in "Name", :with => "My Widget"
    click_button "Create"
    #expect(page).to have_content("Name has already been taken")
    #expect(flash[:notice]).to have_content("Name has already been taken")
    skip()
  end

  scenario "User creates a invalid product" do
    visit "/products/new"

    fill_in "Name", :with => ""
    click_button "Create"
    skip()
    expect(page).to have_text("Product Name required.")
  end


end
