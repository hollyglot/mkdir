class AddJobTitleToStaffMembers < ActiveRecord::Migration
  add_column :staff_members, :job_title, :string
    remove_column :staff_members, :linkedin_info
end
