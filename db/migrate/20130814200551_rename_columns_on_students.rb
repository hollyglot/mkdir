class RenameColumnsOnStudents < ActiveRecord::Migration
  def change
    rename_column :students, :phone_number, :phone
    rename_column :students, :state_province, :state
    rename_column :students, :twitter_handle, :twitter
    rename_column :students, :personal_website, :website
  end
end
