class AddGmapsToStudents < ActiveRecord::Migration
  add_column :students, :latitude,  :float #you can change the name, see wiki
  add_column :students, :longitude, :float #you can change the name, see wiki
  add_column :students, :gmaps, :boolean #not mandatory, see wiki
end
