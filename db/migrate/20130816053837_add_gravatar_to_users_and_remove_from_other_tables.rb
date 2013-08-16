class AddGravatarToUsersAndRemoveFromOtherTables < ActiveRecord::Migration
  def change
    add_column :users, :gravatar, :string
    remove_column :students, :gravatar
    remove_column :mentors, :gravatar
    remove_column :staff_members, :gravatar
    remove_column :hiring_partners, :gravatar
  end
end
