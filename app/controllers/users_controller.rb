class UsersController < ApplicationController
 	before_filter :authenticate_user!
  before_filter :correct_user, only: [:show]
 	before_filter :admin_user, only: [:index, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

   def destroy
    User.find(params[:id]).destroy
    flash[:success] = t 'user_deleted' #"User deleted."
    redirect_to users_url
  end

  private

  def admin_user
    redirect_to(root_path) unless current_user.admin
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user == @user || current_user.admin
  end

end
