require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #new' do
    it 'returns http success' do
      post :new, id: '1'
      expect(response).to have_http_status(:success)
    end
  end
end
