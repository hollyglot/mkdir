class AddMapToStudents < ActiveRecord::Migration
  def change
    add_column :students, :gmaps, :boolean
  end
end
