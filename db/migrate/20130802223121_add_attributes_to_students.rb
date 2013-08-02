class AddAttributesToStudents < ActiveRecord::Migration
  def change
    add_column :students, :attributes, :string
  end
end
