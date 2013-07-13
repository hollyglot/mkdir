class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :cohort
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state_province
      t.string :postal_code
      t.string :country
      t.integer :phone_number
      t.references :user
      t.string :linkedin_id
      t.string :github
      t.string :twitter_handle
      t.string :blog
      t.string :personal_website
      t.string :mentor
      t.string :job_status
      t.string :entrepreneur

      t.timestamps
    end
    add_index :students, :user_id
  end
end
