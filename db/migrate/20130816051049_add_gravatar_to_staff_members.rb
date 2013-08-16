class AddGravatarToStaffMembers < ActiveRecord::Migration
  def change
    add_column :staff_members, :gravatar, :string
  end
end
