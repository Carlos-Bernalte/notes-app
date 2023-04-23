class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :friend, :class_name => 'User'
	
	validates :friend, uniqueness: { scope: :user } 
	validate :autofriendship

	STATUSES = [ "pending", "confirmed"].freeze
	

	private

	def autofriendship
		if user.equal?(friend)
			errors.add(:friend, "You can't follow yourself")
		end 
	end
end
