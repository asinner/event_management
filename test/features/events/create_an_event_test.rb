require 'test_helper'

feature 'Create an event' do
  scenario 'with valid event' do
    sign_in(:andrew)
    visit new_event_path
    fill_in 'Event name', with: 'My first event'
    fill_in 'Event date', with: Date.tomorrow
    click_button 'Create Event'
    page.text.must_include 'My first event'
  end
  
  scenario 'with no name' do
    sign_in(:andrew)
    visit new_event_path
    fill_in 'Event name', with: ''
    fill_in 'Event date', with: Date.tomorrow
    click_button 'Create Event'
    page.text.must_include "Name can't be blank"
  end
  
  scenario 'with no date' do
    sign_in(:andrew)
    visit new_event_path
    fill_in 'Event name', with: 'My first event'
    fill_in 'Event date', with: ''
    click_button 'Create Event'
    page.text.must_include "Starting date can't be blank"
  end
  
  scenario 'with past date' do
    sign_in(:andrew)
    visit new_event_path
    fill_in 'Event name', with: 'My first event'
    fill_in 'Event date', with: 2.days.ago
    click_button 'Create Event'
    page.text.must_include "Starting date can't be in the past"
  end
end