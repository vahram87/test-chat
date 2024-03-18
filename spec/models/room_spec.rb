require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:room) { FactoryBot.create(:room) }
  let(:room1) { FactoryBot.create(:room) }
  let(:user) { FactoryBot.create(:user) }
  let!(:messages) { FactoryBot.create_list(:message, 5, room: room, user: user) }

  describe 'associations' do
    it 'room has many messages' do
      expect(room.messages).to eq(messages)
    end
  end

  describe 'validations' do
    it 'is not valid without a name' do
      room.name = nil

      expect(room).to_not be_valid
      expect(room.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without a name' do
      room.name = room1.name

      expect(room).to_not be_valid
    end

    it 'is valid with a non-nil name' do
      expect(room).to be_valid
    end
  end
end
