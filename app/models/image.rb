class Image < ApplicationRecord
    validates :image, presence: true
    validate :image_type
  
    private
  
    def image_type
      if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
        errors.add(:image, 'must be a JPEG or PNG')
      end
    end
  end