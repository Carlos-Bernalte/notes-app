class CreateNotePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :note_permissions do |t|
      t.integer :note_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
