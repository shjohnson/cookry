module Api
  module V1
    class RecipesController < ApplicationController
      before_action :set_recipe, only: [:show, :update, :destroy]
      respond_to :json, :html

      def index
        @recipes = Recipe.filter(params.slice(:name, :rating))
        render json: @recipes

        # user = User.find_by_id(params[:id])
        # get all recipes of particular user
      end

      def show
        # get a particular recipe of a user
        render json: @recipe
      end

      # get all recipes of the same type
      # Get all recipes of a particular difficulty

      def create
        # Post a new recipe for a user

        @recipe = Recipe.new(recipe_params)

        if @recipe.save
          render json: @recipe, status: :created
        else
          render json: @recipe.errors, status: :unprocessable_entity
        end
      end

      def update
        # Update a new recipe for a user
        @recipe = Recipe.find(params[:id])

        if @recipe.update(recipe_params)
          render json: @recipe, status: :ok
        else
          render json: @recipe.errors, status: :unprocessable_entity
        end
      end

      def destroy
        # Delete a recipe for a user
        @recipe.destroy

        head :no_content
      end

      private

      def set_recipe
        @recipe = Recipe.find(params[:id])
      end

      def recipe_params
        params.require(:recipe).permit(:user_id, :name, :rating)
      end
    end
  end
end
