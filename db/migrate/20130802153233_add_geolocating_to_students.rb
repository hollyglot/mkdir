class AddGeolocatingToStudents < ActiveRecord::Migration
  def change
    add_column :students, :address, :string
    add_column :students, :longitude, :float
    add_column :students, :latitude, :float
  end
end
