require 'rails_helper'
RSpec.describe Api::V1::CommentsController, type: :controller do
  let(:valid_attributes) {
    skip('Add a hash of attributes valid for your model')
  }

  let(:invalid_attributes) {
    skip('Add a hash of attributes invalid for your model')
  }

  describe 'GET #show' do
    it 'assigns the requested comment as @comment' do
      comment = Comment.create! valid_attributes
      get :show, id: comment.to_param
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Comment' do
        expect {
          post :create, comment: valid_attributes
        }.to change(Comment, :count).by(1)
      end

      it 'assigns a newly created comment as @comment' do
        post :create, comment: valid_attributes
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it 'redirects to the created comment' do
        post :create, comment: valid_attributes
        expect(response).to redirect_to(Comment.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved comment as @comment' do
        post :create, comment: invalid_attributes
        expect(assigns(:comment)).to be_a_new(Comment)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        skip('Add a hash of attributes valid for your model')
      }

      it 'updates the requested comment' do
        comment = Comment.create! valid_attributes
        put :update, id: comment.to_param, comment: new_attributes
        comment.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested comment as @comment' do
        comment = Comment.create! valid_attributes
        put :update, id: comment.to_param, comment: valid_attributes
        expect(assigns(:comment)).to eq(comment)
      end

      it 'redirects to the comment' do
        comment = Comment.create! valid_attributes
        put :update, id: comment.to_param, comment: valid_attributes
        expect(response).to redirect_to(comment)
      end
    end

    context 'with invalid params' do
      it 'assigns the comment as @comment' do
        comment = Comment.create! valid_attributes
        put :update, id: comment.to_param, comment: invalid_attributes
        expect(assigns(:comment)).to eq(comment)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested comment' do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, id: comment.to_param
      }.to change(Comment, :count).by(-1)
    end
  end
end
