require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let(:user) { FactoryBot.create(:user) }

  before do
    post '/users/sign_in', params: { user: { email: user.email, password: user.password } }
  end

  describe 'GET /show' do
    it 'returns a success response' do
      get root_path

      expect(response).to be_successful
      expect(response.body).to include('<button class="btn btn-outline-success" type="submit">LogOut</button>')
    end
  end
end
