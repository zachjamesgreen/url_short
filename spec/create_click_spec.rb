require 'rails_helper'

RSpec.describe 'Create Link', type: :request do
  before(:all) do
    @user = create(:user, password: 'password')
    @link = Link.create!(title: 'Zach Green Codes', url: 'https://zachgreen.codes', user: @user, slug: 'testing')
  end

  it 'should create a link' do
    # count = Click.count
    # get '/testing'
    # expect(Click.count).to eq(count + 1)
    # expect(response.body).to include('Zach Green Codes')
    # expect(page).to have_current_path('https://zachgreen.codes')
    # expect(page).to have_content('Zach Green Codes')
  end
end