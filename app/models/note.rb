class Note < ApplicationRecord

    belongs_to :user

    has_many :note_permissions
    has_many :collections_notes

    validates :title, presence: true, length: {maximum: 11}
    validates :text, presence: true

    mount_uploader :image, ImageUploader
end
