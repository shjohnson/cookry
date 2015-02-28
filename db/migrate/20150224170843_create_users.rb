class CreateUsers < ActiveRecord::Migration
  def change
    execute 'CREATE EXTENSION "uuid-ossp" SCHEMA public'
    create_table :users, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :salt
      t.timestamps null: false
    end
  end
end