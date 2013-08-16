class AddJobTitleToMentor < ActiveRecord::Migration
  add_column :mentors, :job_title, :string
    remove_column :mentors, :linkedin_info
end
