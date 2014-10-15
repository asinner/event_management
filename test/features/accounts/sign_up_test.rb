require 'test_helper'

feature 'I want to create an account' do
  scenario 'sign up' do
    visit root_path
    find('#home').click_link('Sign up')
    click_link 'Sign up'
    fill_in 'Email', with: 'joe@example.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
    page.text.must_include 'You have successfully created your account'
    page.text.must_include 'joe@example.com'
  end
end