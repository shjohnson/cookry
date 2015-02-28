require 'rails_helper'

RSpec.describe Api::V1::IngredientsController, type: :controller do
  let(:valid_attributes) {
    skip('Add a hash of attributes valid for your model')
  }

  let(:invalid_attributes) {
    skip('Add a hash of attributes invalid for your model')
  }

  describe 'GET #index' do
    it 'assigns all ingredients as @ingredients' do
      ingredient = Ingredient.create! valid_attributes
      get :index, {}
      expect(assigns(:ingredients)).to eq([ingredient])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested ingredient as @ingredient' do
      ingredient = Ingredient.create! valid_attributes
      get :show, id: ingredient.to_param
      expect(assigns(:ingredient)).to eq(ingredient)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Ingredient' do
        expect {
          post :create, ingredient: valid_attributes
        }.to change(Ingredient, :count).by(1)
      end

      it 'assigns a newly created ingredient as @ingredient' do
        post :create, ingredient: valid_attributes
        expect(assigns(:ingredient)).to be_a(Ingredient)
        expect(assigns(:ingredient)).to be_persisted
      end

      it 'redirects to the created ingredient' do
        post :create, ingredient: valid_attributes
        expect(response).to redirect_to(Ingredient.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved ingredient as @ingredient' do
        post :create, ingredient: invalid_attributes
        expect(assigns(:ingredient)).to be_a_new(Ingredient)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        skip('Add a hash of attributes valid for your model')
      }

      it 'updates the requested ingredient' do
        ingredient = Ingredient.create! valid_attributes
        put :update, id: ingredient.to_param, ingredient: new_attributes
        ingredient.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested ingredient as @ingredient' do
        ingredient = Ingredient.create! valid_attributes
        put :update, id: ingredient.to_param, ingredient: valid_attributes
        expect(assigns(:ingredient)).to eq(ingredient)
      end

      it 'redirects to the ingredient' do
        ingredient = Ingredient.create! valid_attributes
        put :update, id: ingredient.to_param, ingredient: valid_attributes
        expect(response).to redirect_to(ingredient)
      end
    end

    context 'with invalid params' do
      it 'assigns the ingredient as @ingredient' do
        ingredient = Ingredient.create! valid_attributes
        put :update, id: ingredient.to_param, ingredient: invalid_attributes
        expect(assigns(:ingredient)).to eq(ingredient)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested ingredient' do
      ingredient = Ingredient.create! valid_attributes
      expect {
        delete :destroy, id: ingredient.to_param
      }.to change(Ingredient, :count).by(-1)
    end
  end
end