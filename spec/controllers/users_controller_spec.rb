require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    Fabricate.attributes_for(:user)
  }

  let(:invalid_attributes) {
    Fabricate.attributes_for(:user, username: '')
  }

  describe 'GET #show' do
    it 'assigns the requested user as @user' do
      user = User.create! valid_attributes
      get :show, id: user.to_param
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect {
          post :create, user: valid_attributes
        }.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        post :create, user: valid_attributes
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it 'redirects to the created user' do
        post :create, user: valid_attributes
        expect(response.body).to include(User.last.username)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved user as @user' do
        post :create, user: invalid_attributes
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        Fabricate.attributes_for(:user)
      }

      it 'updates the requested user' do
        user = User.create! valid_attributes
        put :update, id: user.to_param, user: new_attributes
        user.reload
        skip('create assertations for updated state')
      end

      it 'assigns the requested user as @user' do
        user = User.create! valid_attributes
        put :update, id: user.to_param, user: valid_attributes
        expect(assigns(:user)).to eq(user)
      end

      it 'shows the newly updated user' do
        user = User.create! valid_attributes
        put :update, id: user.to_param, user: valid_attributes
        expect(response.body).to include(User.last.username)
      end
    end

    context 'with invalid params' do
      it 'assigns the user as @user' do
        user = User.create! valid_attributes
        put :update, id: user.to_param, user: invalid_attributes
        expect(assigns(:user)).to eq(user)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      expect {
        delete :destroy, id: user.to_param
      }.to change(User, :count).by(-1)
    end
  end
end
