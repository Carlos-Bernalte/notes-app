class CreateUserNotePermissionJoin < ActiveRecord::Migration[7.0]
  def change
    create_table :note_permissions_users, :id => false do |t|
      t.integer :user_id
      t.integer :note_permission_id
    end
    add_index :note_permissions_users, [:user_id, :note_permission_id], :name => "user_index"
  end
end
