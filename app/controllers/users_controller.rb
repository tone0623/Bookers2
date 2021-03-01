class UsersController < ApplicationController
  
  before_action :check_user, {only: [:edit,:update,:destroy]}
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      flash[:notice] = " errors prohibited this obj from being saved:"
      render "edit"
    
    end
  end
  
  private 
  
  def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def check_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to users_path
    end
  end
end
