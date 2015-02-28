class AddRecipeUuidToComments < ActiveRecord::Migration
  def change
    add_column :comments, :recipe_uuid, :uuid, index: true
  end
end
