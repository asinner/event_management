require 'test_helper'

feature 'Destroy an event' do
  scenario 'logged in user can destroy their event' do
    sign_in(:andrew)
    visit event_path(events(:one))    
    click_link 'Delete'
    page.text.must_include 'Event removed'
  end
  
  scenario "logged in user cannot destroy another account's event" do
    sign_in(:andrew)
    visit event_path(events(:three))
    page.wont_have_link 'Delete'
  end
end