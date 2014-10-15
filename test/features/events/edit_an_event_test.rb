require 'test_helper'

feature 'Editing an event' do
  scenario 'logged in user edit their event' do
    sign_in(:andrew)
    visit edit_event_path(events(:one))
    fill_in 'Event name', with: 'Updated event name'
    click_on 'Update Event'
    page.text.must_include 'Updated event name'
  end
  
  scenario 'logged in user cannot edit different account events' do
    sign_in(:andrew)
    visit edit_event_path(events(:three))
    page.text.must_include 'You are not authorized to perform that action'
  end
  
  scenario 'visitors cannot edit any events' do
    visit edit_event_path(events(:three))
    page.text.must_include 'You must be signed in to perform that action'
  end
end