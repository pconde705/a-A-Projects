require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New User'
  end
end

  feature 'signing up a user' do
    before(:each) do

      visit new_user_url
      fill_in 'Username', with: 'test_username'
      fill_in 'Password', with: 'password'
      click_on 'Create User'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'Goals'
      expect(page).to have_content 'test_username'
    end
  end

feature 'logging in' do
  before(:each) do
    visit new_user_url
    fill_in 'Username', with: 'test_username'
    fill_in 'Password', with: 'password'
    click_on 'Create User'
    click_button('Log out')


    visit new_session_url
    fill_in 'Username', with: 'test_username'
    fill_in 'Password', with: 'password'
    click_on 'Log In'

  end

  scenario 'shows username on the homepage after login' do

    expect(page).to have_content 'Goals'
      # debugger
    expect(page).to have_content 'test_username'
  end
end

feature 'logging out' do
  before(:each) do
    visit new_user_url
    fill_in 'Username', with: 'test_username'
    fill_in 'Password', with: 'password'
    click_on 'Create User'
    click_button('Log out')

    visit new_session_url
    fill_in 'Username', with: 'test_username'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    click_button('Log out')
    # visit new_user_url

  end

  scenario 'doesn\'t show username on the homepage after logout' do
    expect(page).not_to have_content 'test_username'
  end

end
