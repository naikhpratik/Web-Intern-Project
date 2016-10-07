require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "Product", :type => :feature do
  scenario "User creates a valid product" do
    visit new_admin_product_url

    expect(page).to have_text("You are not authorized to access this page")
  end

  scenario "User creates a valid product" do
    login
    visit new_admin_product_url

    fill_in 'Title', :with => "My Widget"
    select "All", from: 'product[visibility]'
    click_button "Create"
    expect(page).to have_text("Product was successfully created")
  end

  scenario "User creates a duplicate product" do
    product = FactoryGirl.create(:product, title: "My Widget")

    login
    visit new_admin_product_url

    fill_in "Title", :with => "My Widget"
    select "All", from: 'product[visibility]'
    click_button "Create"

    expect(page).to have_content("Title has already been taken")
  end

  scenario "User creates a invalid product" do
    login
    visit new_admin_product_url

    fill_in "Title", :with => ""
    click_button "Create"

    expect(page).to have_content("Title can't be blank")
  end

  scenario "Admin updates a Product with its contents" do
    product = FactoryGirl.create(:product)
    
    modulee = FactoryGirl.create(:modulee)
    modulee.product_id = product.id
    modulee.save!

    login
    visit edit_admin_product_path(product)

    fill_in "product[contents_attributes][0][name]", with: 'My Module'
    fill_in "product[contents_attributes][0][attr_1]", with: 'Attribute Value'

    click_button "Update"

    expect(page).to have_text("Product was successfully updated")
  end

  scenario "Admin destroys contents of a Product" do
    product = FactoryGirl.create(:product)
    
    modulee = FactoryGirl.create(:modulee)
    modulee.product_id = product.id
    modulee.save!

    login
    visit edit_admin_product_path(product)

    all('.remove_fields').first.click

    click_button "Update"

    expect(page).to have_text("Product was successfully updated")
  end

  scenario "Admin destroys a Product" do
    # product = FactoryGirl.create(:product)

    # login
    # visit admin_products_path

    # all('.btn-group > button').first.click
  end

  private

  def login
    user = FactoryGirl.create(:user)
    role = Role.create(name: 'Admin')
    user.roles = [role]
    user_role = UserRole.create(user_id: user.id, role_id: role.id)
    user.save!

    visit new_user_session_url
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
  end

end
