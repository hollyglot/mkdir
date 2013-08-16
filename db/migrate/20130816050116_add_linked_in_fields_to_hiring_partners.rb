class AddLinkedInFieldsToHiringPartners < ActiveRecord::Migration
  def change
    add_column :hiring_partners, :company_name, :string
    add_column :hiring_partners, :website, :string
    remove_column :hiring_partners, :linkedin_info
  end
end
