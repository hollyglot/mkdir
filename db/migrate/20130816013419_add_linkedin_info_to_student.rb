class AddLinkedinInfoToStudent < ActiveRecord::Migration
  def change
    add_column :students, :linkedin_info, :text
  end
end
