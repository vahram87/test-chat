require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:room) { FactoryBot.create(:room) }
  let!(:message) { FactoryBot.create(:message, room: room, user: user) }

  describe 'associations' do
    it 'belongs to a room' do
      expect(message.room).to eq(room)
    end

    it 'belongs to a user' do
      expect(message.user).to eq(user)
    end
  end

  describe 'validations' do
    it 'is valid with valid parameters' do
      expect(message).to be_valid
    end

    it "can't exist without content" do
      message.content = nil

      expect(message).not_to be_valid
    end
  end
end
