class ChangeType < ActiveRecord::Migration
 def change
    rename_column :hiring_partners, :type, :company_type
  end
end
