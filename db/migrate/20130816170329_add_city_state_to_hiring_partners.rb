class AddCityStateToHiringPartners < ActiveRecord::Migration
  def change
    add_column :hiring_partners, :state, :text
    add_column :hiring_partners, :city, :text
  end
end
