class RemoveUserAttributesFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :user_attributes
  end
end
