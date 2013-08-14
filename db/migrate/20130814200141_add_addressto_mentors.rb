class AddAddresstoMentors < ActiveRecord::Migration
  def change
    add_column :mentors, :address, :string
  end
end
