class AddCompanyToHiringPartners < ActiveRecord::Migration
  def change
    add_column :hiring_partners, :company, :string
  end
end
