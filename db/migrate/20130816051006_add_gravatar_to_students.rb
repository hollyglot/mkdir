class AddGravatarToStudents < ActiveRecord::Migration
  def change
    add_column :students, :gravatar, :string
  end
end
