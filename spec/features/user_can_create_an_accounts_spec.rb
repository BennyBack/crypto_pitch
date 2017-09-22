require 'rails_helper'
require 'bcrypt'
RSpec.feature "UserCanCreateAnAccounts", type: :feature do
  scenario "User clicks sign up link from homepage" do
    visit root_path
    click_link "Sign Up"
    expect(page).to have_text "Sign Up"
    fill_in("First name", :with => Faker::Name.first_name)
    fill_in("Last name", :with => Faker::Name.last_name)
    fill_in("Email", :with => Faker::Internet.email)
    fill_in("Phone number", :with => Faker::PhoneNumber.cell_phone)
    fill_in("Password", :with => "password")
    fill_in("Confirmation", :with => Bcrypt::Password.create("password"))

  end
end
