module Api
  module V1
    class RecipesController < ApplicationController
      before_action :set_recipe, only: [:show, :update, :destroy]

      def index
        # get all recipes of particular user
        @recipes = Recipe.all

        render json: @recipes
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
          render json: @recipe, status: :created, location: @recipe
        else
          render json: @recipe.errors, status: :unprocessable_entity
        end
      end

      def update
        # Update a new recipe for a user
        @recipe = Recipe.find(params[:id])

        if @recipe.update(recipe_params)
          head :no_content
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
        params.require(:recipe).permit(:name, :rating)
      end
    end
  end
end
