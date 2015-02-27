require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:valid_attributes) {
    skip('Add a hash of attributes valid for your model')
  }

  let(:invalid_attributes) {
    skip('Add a hash of attributes invalid for your model')
  }

  describe 'GET #index' do
    it 'assigns all recipes as @recipes' do
      recipe = Recipe.create! valid_attributes
      get :index, {}
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
          post :create, recipe: valid_attributes
        }.to change(Recipe, :count).by(1)
      end

      it 'assigns a newly created recipe as @recipe' do
        post :create, recipe: valid_attributes
        expect(assigns(:recipe)).to be_a(Recipe)
        expect(assigns(:recipe)).to be_persisted
      end

      it 'redirects to the created recipe' do
        post :create, recipe: valid_attributes
        expect(response).to redirect_to(Recipe.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved recipe as @recipe' do
        post :create, recipe: invalid_attributes
        expect(assigns(:recipe)).to be_a_new(Recipe)
      end

      it "re-renders the 'new' template" do
        post :create, recipe: invalid_attributes
        expect(response).to render_template('new')
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

      it 'redirects to the recipe' do
        recipe = Recipe.create! valid_attributes
        put :update, id: recipe.to_param, recipe: valid_attributes
        expect(response).to redirect_to(recipe)
      end
    end

    context 'with invalid params' do
      it 'assigns the recipe as @recipe' do
        recipe = Recipe.create! valid_attributes
        put :update, id: recipe.to_param, recipe: invalid_attributes
        expect(assigns(:recipe)).to eq(recipe)
      end

      it "re-renders the 'edit' template" do
        recipe = Recipe.create! valid_attributes
        put :update, id: recipe.to_param, recipe: invalid_attributes
        expect(response).to render_template('edit')
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

    it 'redirects to the recipes list' do
      recipe = Recipe.create! valid_attributes
      delete :destroy, id: recipe.to_param
      expect(response).to redirect_to(recipes_url)
    end
  end
end
