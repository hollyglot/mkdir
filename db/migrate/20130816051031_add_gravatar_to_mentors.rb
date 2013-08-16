class AddGravatarToMentors < ActiveRecord::Migration
  def change
    add_column :mentors, :gravatar, :string
  end
end
