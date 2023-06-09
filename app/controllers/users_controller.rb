class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show edit update destroy ]
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if logged?
      @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to users_path
      else
        render 'edit'
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private
    # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password, :admin)
  end
  def set_default_admin
    self.admin ||= false
  end
  
  def logged?
    session[:username]
  end
end
