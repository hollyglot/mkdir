class ChangeNameOnHiringPartners < ActiveRecord::Migration
  def change
    rename_column :hiring_partners, :company_name, :name
  end
end
