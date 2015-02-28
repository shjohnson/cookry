class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients, id: :uuid do |t|
      t.string :name
      t.string :amount

      t.timestamps null: false
    end
  end
end
