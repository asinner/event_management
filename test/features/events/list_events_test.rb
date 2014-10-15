require 'test_helper'

feature 'List events' do
  scenario 'logged in user sees their events only' do
    sign_in(:andrew)
    visit events_path
    page.text.must_include 'My first event'
    page.text.must_include 'My second event'
    page.text.wont_include 'Random event'
  end
  
  scenario 'non-logged in user cannot access events' do
    visit events_path
    page.text.must_include 'You must be signed in to perform that action'
  end
end