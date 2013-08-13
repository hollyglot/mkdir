class UpdateUserIndex < ActiveRecord::Migration
  def change
    remove_index :users, :email
    remove_index :users, :reset_password_token
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
  end
end
