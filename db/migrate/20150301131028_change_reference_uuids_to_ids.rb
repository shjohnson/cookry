class ChangeReferenceUuidsToIds < ActiveRecord::Migration
  def change
    rename_column :comments, :recipe_uuid, :recipe_id
    rename_column :comments, :user_uuid, :user_id
    rename_column :ingredients, :recipe_uuid, :recipe_id
    rename_column :recipes, :user_uuid, :user_id
  end
end
