class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user
      t.string :message
      t.string :time

      t.timestamps
    end
  end
end
