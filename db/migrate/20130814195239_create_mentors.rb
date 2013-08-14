class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.references :user
      t.string :name
      t.integer :phone
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps
      t.string :linkedin
      t.string :github
      t.string :twitter
      t.string :blog
      t.string :website
      t.string :developer_type

      t.timestamps
    end
    add_index :mentors, :user_id
  end
end
