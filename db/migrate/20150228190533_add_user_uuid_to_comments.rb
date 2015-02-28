class AddUserUuidToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_uuid, :uuid, index: true
  end
end
