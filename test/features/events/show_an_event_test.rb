require 'test_helper'

feature 'Show an event' do
  scenario 'A logged in user can see their event page' do
    sign_in(:andrew)
    visit event_path(events(:one))
    page.text.must_include(events(:one).name)
  end
  
  scenario "A logged in user can see another account's event page" do
    sign_in(:andrew)
    visit event_path(events(:three))
    page.text.must_include(events(:three).name)
  end
  
  scenario 'A visit can see any event page' do
    visit event_path(events(:three))
    page.text.must_include(events(:three).name)
  end
end