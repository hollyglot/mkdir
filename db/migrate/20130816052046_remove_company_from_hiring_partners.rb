class RemoveCompanyFromHiringPartners < ActiveRecord::Migration
  def change
    remove_column :hiring_partners, :company
  end
end
