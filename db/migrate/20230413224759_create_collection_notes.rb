class CreateCollectionNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_notes do |t|
      t.integer :collection_id
      t.integer :note_id

      t.timestamps
    end
  end
end
