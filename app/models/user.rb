class User < ApplicationRecord
    before_create :set_default_admin
    has_many :notes, dependent: :destroy
    # has_many :friendships, dependent: :destroy
    # has_many :friends, :through => :friendships
    # has_and_belongs_to_many :note_permission
    # has_many :collections, dependent: :destroy
    
    validates :username, presence: true, length: { maximum: 10 }, uniqueness: { case_sensitive: false }
    before_save { self.email = email.downcase }
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i }, uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 8 }

    private

    def set_default_admin
        self.admin ||= false
    end
    
end
