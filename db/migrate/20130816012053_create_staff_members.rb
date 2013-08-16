class CreateStaffMembers < ActiveRecord::Migration
  def change
    create_table :staff_members do |t|
      t.references :user
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :phone
      t.string :linkedin
      t.text :linkedin_info
      t.string :github
      t.string :twitter
      t.string :blog
      t.string :website
      t.string :developer_type
      t.boolean :gmaps
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps

      t.timestamps
    end
    add_index :staff_members, :user_id
  end
end
