class AddUserUuidToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :user_uuid, :uuid, index: true
  end
end
