require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe 'GET /groups' do
    before(:example) { get('/groups') }
    it 'returns http found' do
      expect(response).to have_http_status(:found)
    end
    it 'should be redirected to sign_in' do
      expect(response).to redirect_to(new_user_session_path)
    end
    it 'includes the correct placeholder text' do
      expect(response.body).to include 'redirected'
    end
  end
end
