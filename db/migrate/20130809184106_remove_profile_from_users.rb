class RemoveProfileFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :profile
  end

  def down
    add_column :users, :profile, :string
  end
end
