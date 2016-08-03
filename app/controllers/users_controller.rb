class UsersController < ApplicationController
  before_action :logged_in_user, :correct_user, only: [:edit, :update]
  before_action :admin_user,     only: [:index, :destroy]

  #cheeck if need log out
  # before_action :require_logout, only: [:new]


  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome In!!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User say bye bye..."
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :picture, :profile_description)
    end

    # before filters

    # confirms correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # confirms an admin user

    def admin_user
      current_user ? (redirect_to(root_url) unless current_user.admin?): redirect_to(root_url)
    end

    def require_logout
      if logged_in?
        flash[:warning] = "Please log out first"
        redirect_to(root_url)
      end
    end
end
