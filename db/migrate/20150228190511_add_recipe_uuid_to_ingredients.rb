class AddRecipeUuidToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :recipe_uuid, :uuid, index: true
  end
end
