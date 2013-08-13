class DropActiveComments < ActiveRecord::Migration
  def up
    drop_table :active_admin_comments
  end

  def down
    create_table :active_admin_comments do |t|
      t.string   :resource_id  
      t.string   :resource_type
      t.integer  :author_id
      t.string   :author_type
      t.text     :body
      t.datetime :created_at    
      t.datetime :updated_at    
      t.string   :namespace
    end
    add_index(:active_admin_comments, [:author_type, :author_id], :name => "index_active_admin_comments_on_author_type_and_author_id")
    add_index(:active_admin_comments, [:namespace], :name => "index_active_admin_comments_on_namespace")
    add_index(:active_admin_comments, [:resource_type, :resource_id], :name => "index_admin_notes_on_resource_type_and_resource_id")
  end

end
