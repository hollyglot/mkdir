class ChangeAttributesName < ActiveRecord::Migration
  def change
    rename_column :students, :attributes, :user_attributes
  end
end
