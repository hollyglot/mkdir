class CreateHiringPartners < ActiveRecord::Migration
  def change
    create_table :hiring_partners do |t|
      t.references :user
      t.string :linkedin
      t.text :linkedin_info
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
    add_index :hiring_partners, :user_id
  end
end
