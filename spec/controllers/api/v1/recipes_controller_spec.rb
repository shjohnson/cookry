require 'rails_helper'

RSpec.describe Api::V1::RecipesController, type: :controller do
  let(:valid_attributes) {
    Fabricate.attributes_for(:recipe)
  }

  let(:invalid_attributes) {
    Fabricate.attributes_for(:recipe, name: '')
  }

  let(:signed_user) {
    pending('need to create user authentication')
  }

  describe 'GET #index' do
    it 'assigns all recipes for a user as @recipes' do
      recipe = Recipe.create! valid_attributes
      get :index
      expect(assigns(:recipes)).to eq([recipe])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested recipe as @recipe' do
      recipe = Recipe.create! valid_attributes
      get :show, id: recipe.to_param
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Recipe' do
        expect {
          post :create, signed_user, recipe: valid_attributes
        }.to change(Recipe, :count).by(1)
      end

      it 'assigns a newly created recipe as @recipe' do
        post :create, signed_user, recipe: valid_attributes
        expect(assigns(:recipe)).to be_a(Recipe)
        expect(assigns(:recipe)).to be_persisted
      end

      it 'redirects to the created recipe' do
        post :create, signed_user, recipe: valid_attributes
        expect(response).to redirect_to(Recipe.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved recipe as @recipe' do
        post :create, signed_user, recipe: invalid_attributes
        expect(assigns(:recipe)).to be_a_new(Recipe)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        skip('Add a hash of attributes valid for your model')
      }

      it 'updates the requested recipe' do
        recipe = Recipe.create! valid_attributes
        put :update, id: recipe.to_param, recipe: new_attributes
        recipe.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested recipe as @recipe' do
        recipe = Recipe.create! valid_attributes
        put :update, id: recipe.to_param, recipe: valid_attributes
        expect(assigns(:recipe)).to eq(recipe)
      end

      it 'redirects to the newly created recipe' do
        recipe = Recipe.create! valid_attributes
        put :update, id: recipe.to_param, recipe: valid_attributes
        expect(response.body).to include(Recipe.last.id)
      end
    end

    context 'with invalid params' do
      it 'assigns the recipe as @recipe' do
        recipe = Recipe.create! valid_attributes
        put :update, id: recipe.to_param, recipe: invalid_attributes
        expect(assigns(:recipe)).to eq(recipe)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested recipe' do
      recipe = Recipe.create! valid_attributes
      expect {
        delete :destroy, id: recipe.to_param
      }.to change(Recipe, :count).by(-1)
    end

    context 'if the user has other recipes' do
      specify 'redirects to the users recipes list' do
      end
    end
    context 'if the user had no other recipes' do
      specify 'it redirects them to create recipe page' do
      end
    end
  end
end
