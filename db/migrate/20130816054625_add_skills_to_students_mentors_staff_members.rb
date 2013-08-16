class AddSkillsToStudentsMentorsStaffMembers < ActiveRecord::Migration
  def change
    add_column :students, :skills, :text
    add_column :mentors, :skills, :text
    add_column :staff_members, :skills, :text
  end
end
