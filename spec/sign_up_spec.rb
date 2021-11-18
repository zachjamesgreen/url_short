require 'rails_helper'

RSpec.describe 'Sign Up', type: :feature do
  it 'should sign up user' do
    visit '/sign_up'
    fill_in 'user_name', with: 'testing'
    fill_in 'user_email', with: 'user1@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Create User'
    expect(page).to have_content(/You have successfully signed up./)
    expect(page).to have_content(/Create/)
    expect(page).to have_content(/testing/)
    expect(page).to have_content(/Log Out/)
    click_on 'Log Out'
    expect(page).to have_content(/Sign Up/)
    expect(page).to have_content(/Sign In/)
  end

  it 'should not sign up user with invalid email' do
    visit '/sign_up'
    fill_in 'user_name', with: 'testing'
    fill_in 'user_email', with: 'user1'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Create User'
    expect(page).to have_content(/Invalid email/)
  end

  it 'should not sign up user with invalid name' do
    visit '/sign_up'
    fill_in 'user_name', with: ''
    fill_in 'user_email', with: 'user1@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Create User'
    expect(page).to have_content(/Name can't be blank/)
  end

  it 'should not sign up user if passwords dont match' do
    visit '/sign_up'
    fill_in 'user_name', with: 'test'
    fill_in 'user_email', with: 'user1@example.com'
    fill_in 'user_password', with: 'pass'
    fill_in 'user_password_confirmation', with: 'word'
    click_on 'Create User'
    expect(page).to have_content(/Password confirmation doesn't match Password/)
  end
end