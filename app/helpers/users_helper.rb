module UsersHelper
  def user_session_is_admin?
    if logged?
      admin = User.where(username: session[:username]).first.admin
    end
    admin
  end

  def get_user_name(user_id)
      user = User.where(id: user_id).first
  end

  def get_user_id(username)
    user = User.find_by(username: username).id
  end
  def logged?
    session[:username]
  end

end
  
