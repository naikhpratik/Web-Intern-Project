require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "Product", :type => :feature do
  scenario "Admin creates a valid product" do
    login 'Admin'
    visit new_admin_product_url

    fill_in 'Title', :with => "My Widget"
    select "All", from: 'product[visibility]'
    click_button "Create"

    expect(page).to have_text("Product was successfully created")
  end

  scenario "Product Manager creates a Product" do
    login 'Product Manager'
    visit new_admin_product_url

    fill_in 'Title', :with => "My Widget"
    select "All", from: 'product[visibility]'
    click_button "Create"

    expect(page).to have_text("Product was successfully created")
  end

  scenario "Normal User can't create a Product" do
    login
    visit new_admin_product_url

    expect(page).to have_text("You are not authorized to access this page")
  end

  scenario "Admin creates a duplicate product" do
    product = FactoryGirl.create(:product, title: "My Widget")
    
    login 'Admin'
    visit new_admin_product_url
    
    fill_in "Title", :with => "My Widget"
    select "All", from: 'product[visibility]'
    click_button "Create"

    expect(page).to have_content("Title has already been taken")
  end

  scenario "Admin creates a invalid product" do
    login 'Admin'
    visit new_admin_product_url

    fill_in "Title", :with => ""
    click_button "Create"

    expect(page).to have_content("Title can't be blank")
  end

  private

  def login (role_name = nil)
    user = FactoryGirl.create(:user)
    
    if role_name.present?
      role = Role.create(name: role_name)
      user.roles = [role]
      user_role = UserRole.create(user_id: user.id, role_id: role.id)
    end
    
    user.save!

    visit new_user_session_url
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
  end

end
