require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let!(:room) { FactoryBot.create(:room) }

  before do
    post '/users/sign_in', params: { user: { email: user.email, password: user.password } }
  end

  describe 'GET #show' do
    let!(:room1) { Room.create(name: 'any-room', is_public: false)}

    it 'returns a successful response' do
      get room_path(room)

      expect(response).to be_successful
      expect(response.body).to include(room.name)
    end
  end

  describe 'GET #index' do
    let!(:room1) { Room.create(name: 'any-room', is_public: false)}

    it 'returns a false response' do
      get root_path

      expect(response).to have_http_status(:success)
      expect(response.body).to include(room.name)
      expect(response.body).not_to include(room1.name)
    end
  end
end
