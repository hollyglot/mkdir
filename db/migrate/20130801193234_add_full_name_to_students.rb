class AddFullNameToStudents < ActiveRecord::Migration
  def change
    add_column :students, :full_name, :string
  end
end
