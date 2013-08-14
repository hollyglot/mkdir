class AddDeveloperTypeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :developer_type, :string
  end
end
