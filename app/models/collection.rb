class Collection < ApplicationRecord
  belongs_to :user
  has_many :collections_notes, through: :collections_notes
  validates :name, presence: true, length: { maximum: 10 }, uniqueness: { case_sensitive: false }

end
