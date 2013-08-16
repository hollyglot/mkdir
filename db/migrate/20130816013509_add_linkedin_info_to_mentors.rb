class AddLinkedinInfoToMentors < ActiveRecord::Migration
  def change
    add_column :mentors, :linkedin_info, :text
  end
end
