module FriendshipsHelper

	def get_friendships(friend_id, status)
		if status.eql? 'pending'
			friendships = Friendship.where(friend_id: friend_id, status: status)
		else status.eql? 'confirmed'
			friendships = Friendship.where(user_id: friend_id).or(Friendship.where(friend_id: friend_id)).where(status: status)
		end
	end

	def get_new_friendships(user_id)
		users_ids = Friendship.where(user_id: user_id).pluck(:friend_id)
		u = Friendship.where(friend_id: user_id).pluck(:user_id)
		users_ids = users_ids + u unless u.empty?
		users_ids << user_id
		
		users = get_all_users_except(users_ids)

	end

	def get_all_users_except(id)
		User.where.not(id: id)
	end
	def find_user(user_id, friendship)
		user = User.where(id: user_id).first
		if friendship.user_id.eql? user.id 
			id = friendship.friend_id
		else
			id = friendship.user_id
		end
  		User.find(id)
  	end

	def get_user_id(username)
		user = User.find_by(username: username).id
	end

  	
end
