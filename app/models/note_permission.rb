class NotePermission < ApplicationRecord
  has_one :note
  has_and_belongs_to_many :user
end
