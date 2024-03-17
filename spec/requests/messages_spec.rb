require 'rails_helper'

RSpec.describe "Messages", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:room) { FactoryBot.create(:room) }
  let!(:message) { FactoryBot.create(:message, room: room, user: user) }

  before do
    post '/users/sign_in', params: { user: { email: user.email, password: user.password } }
  end
  describe "GET /show" do
    it 'returns a successful response' do
      get room_path(room)

      expect(response).to be_successful
      expect(response.body).to include(room.name)
      expect(response.body).to include(message.content)
      expect(room.messages.size).to eq(1)
      expect(response.body).to include('Create Message')
    end
  end

  describe 'POST #create' do
    let(:valid_message_params) do
      {
        message: FactoryBot.attributes_for(:message)
      }
    end

    it 'creates a new message with valid parameters' do
      post room_messages_path(room), params: valid_message_params

      created_message = room.messages.last

      expect(response).to redirect_to(
        room_path(room)
      )

      follow_redirect!

      expect(response.body).to include(created_message.content)
      expect(response.body).to include(user.username)
    end
  end
end
