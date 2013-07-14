class UpdateColumnName < ActiveRecord::Migration
  def change
    rename_column :students, :linkedin_id, :linkedin
  end
end
