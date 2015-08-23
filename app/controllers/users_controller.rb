

class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy

  def new
  	@user = User.new
  end
  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page]) 
    #@user.microposts.all
  end

  def index
    @users = User.paginate(page: params[:page])
    #@users = @users.paginate(:page => params[:page], :per_page => 2)
  end

  def destroy 
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def create
     @user = User.new(name: user_params[:name], email: user_params[:email], password: user_params[:password], password_confirmation: user_params[:password_confirmation])
    if @user.save
      #@user.send_activation_email
      #flash[:info] = "Please check your email to activate your account."
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
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
      flash[:sucess] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private    

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
