class AddJobTitleToStudent < ActiveRecord::Migration
  def change
    add_column :students, :job_title, :string
    remove_column :students, :linkedin_info
  end
end
