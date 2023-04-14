class CreateCollectionNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_notes do |t|
      t.references :note, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
