class AddGravatarToHiringPartners < ActiveRecord::Migration
  def change
    add_column :hiring_partners, :gravatar, :string
  end
end
