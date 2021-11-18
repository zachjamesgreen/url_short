require 'rails_helper'

RSpec.describe 'Sign In', type: :feature do
  it 'should sign in user' do
    user = create(:user, password: 'asdfasdf')
    visit '/sign_in'
    fill_in 'email', with: user.email
    fill_in 'password', with: 'asdfasdf'
    click_on 'Submit'
    expect(page).to have_content /You have successfully logged in./
    expect(page).to have_content 'Log Out'
    expect(page).to have_content user.name
  end

  it 'should not sign in user with invalid email' do
    visit '/sign_in'
    fill_in 'email', with: 'user1'
    fill_in 'password', with: 'password'
    click_on 'Submit'
    expect(page).to have_content 'Invalid email/password combination.'
  end

  it 'should not sign in user with invalid password' do
    user = create(:user, password: 'asdfasdf')
    visit '/sign_in'
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_on 'Submit'
    expect(page).to have_content 'Invalid email/password combination.'
  end
end