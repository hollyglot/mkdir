class AddLinkedInFieldstoHiringPartner < ActiveRecord::Migration
  def change
    add_column :hiring_partners, :industry, :text
    add_column :hiring_partners, :type, :text
    add_column :hiring_partners, :company_size, :text
    add_column :hiring_partners, :founded, :integer
    add_column :hiring_partners, :description, :text

  end
end
