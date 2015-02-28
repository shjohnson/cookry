class RemoveUnusedIds < ActiveRecord::Migration
  def up
    remove_column :comments, :recipe_id
    remove_column :comments, :user_id
    remove_column :ingredients, :recipe_id
    remove_column :recipes, :user_id
  end

  def down
    add_column :comments, :recipe_id
    add_column :comments, :user_id
    add_column :ingredients, :recipe_id
    add_column :recipes, :user_id
  end
end

