class AddRecipeToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :recipe, index: true
  end
end
