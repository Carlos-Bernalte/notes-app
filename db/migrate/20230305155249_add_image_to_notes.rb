class AddImageToNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :image, :string
  end
end
