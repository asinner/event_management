require 'test_helper'

feature 'Create a vendor' do
  scenario 'valid vendor' do
    visit new_vendor_path
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Category', with: 'Photobooth'
    fill_in 'Phone number', with: '(555) 123-4567'
    click_on 'Create Vendor'
    page.text.must_include 'Vendor successfully created'
  end
end