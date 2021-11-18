require 'rails_helper'

RSpec.describe 'Create Link', type: :feature do
  before(:all) do
    @user = create(:user, password: 'password')
  end

  def login
    visit '/sign_in'
    fill_in 'email', with: @user.email
    fill_in 'password', with: 'password'
    click_button 'Submit'
  end

  describe 'Create Link', :vcr do
    it 'should create a new link' do
      login
      visit '/links/new'
      fill_in 'link_url', with: 'https://zachgreen.codes'
      click_on 'Create Link'
      expect(page).to have_content('Zach Green Codes')
    end
  end

  it 'should not create link if url is not present' do
    login
    visit '/links/new'
    fill_in 'link_url', with: ''
    click_on 'Create Link'
    expect(page).to have_content(/Url can't be blank/)
  end
end