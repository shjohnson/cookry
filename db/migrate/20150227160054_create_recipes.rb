class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes, id: :uuid do |t|
      t.string :name
      t.integer :rating

      t.timestamps null: false
    end
  end
end
