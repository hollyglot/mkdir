class DropAdminUsers < ActiveRecord::Migration
  def up
    drop_table :admin_users
  end

  def down
    create_table :admin_users do |t|
      t.string   :email                 
      t.string   :encrypted_password
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
