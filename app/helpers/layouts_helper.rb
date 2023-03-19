module LayoutsHelper
	def user_id(username)
		User.where(username: username).first.id
	end

	def user_name(user_id)
		User.where(id: user_id).first
	end
end
