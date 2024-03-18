require 'rails_helper'

RSpec.describe User, type: :model do
  let(:room) { FactoryBot.create(:room) }
  let(:user) { FactoryBot.create(:user) }
  let!(:messages) { FactoryBot.create_list(:message, 5, room: room, user: user) }

  describe 'associations' do
    it 'user has many messages' do
      expect(user.messages).to eq(messages)
    end
  end

  describe 'validations' do
    it 'is not valid without a name' do
      user.username = nil

      expect(user).to_not be_valid
      expect(user.errors[:username]).to include("can't be blank")
    end

    it 'is valid with valid parameters' do
        expect(user).to be_valid
    end
  end
end
