require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:name) }
    it { should allow_value('user1@example.com').for(:email) }
    it { should_not allow_value('user1@examplecom').for(:email) }
    it { should_not allow_value('user1example.com').for(:email) }
    it { should_not allow_value('user1examplecom').for(:email) }
    it { should have_secure_password }
    it { should have_many(:links) }
    it { should have_many(:clicks) }
  end

  describe '#downcase_email' do
    user = User.new(name: 'zach', email: 'USER1@EXAMPLE.COM', password: 'testing')
    it 'should downcase the email' do
      expect(user.email).to eq('USER1@EXAMPLE.COM')
      user.save!
      expect(user.email).to eq('user1@example.com')
    end
  end
end