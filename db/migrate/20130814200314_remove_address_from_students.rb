class RemoveAddressFromStudents < ActiveRecord::Migration
    def up
    remove_column :students, :address_1
    remove_column :students, :address_2
  end

  def down
    add_column :students, :address_1
    add_column :students, :address_2
  end
end
