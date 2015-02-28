class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments, id: :uuid do |t|
      t.string :message

      t.timestamps null: false
    end
  end
end
