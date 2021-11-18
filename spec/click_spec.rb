require 'rails_helper'

RSpec.describe Click, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:date) }
    it { should belong_to(:link) }
  end
end