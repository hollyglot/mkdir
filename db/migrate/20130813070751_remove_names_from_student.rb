class RemoveNamesFromStudent < ActiveRecord::Migration
  def up
    remove_column :students, :first_name
    remove_column :students, :last_name
    remove_column :students, :full_name
  end

  def down
    add_column :students, :first_name
    add_column :students, :last_name
    add_column :students, :full_name
  end
end
