class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def show
  	@user = User.find(params[:id])
  end


  def create
    @user = User.new(name: user_params[:name], email: user_params[:email], password: user_params[:password], password_confirmation: user_params[:password_confirmation])
    if @user.save
      #@user.send_activation_email
      #flash[:info] = "Please check your email to activate your account."
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end



  private    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
