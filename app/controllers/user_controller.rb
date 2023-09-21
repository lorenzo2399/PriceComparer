class UserController < ApplicationController
	    before_action :authenticate_user!


	    
  def show
  	@user=User.find(params[:id])
  end
  
  def correct_user
    @user = User.find_by(id: params[:id])  #find the post
    unless current_user?(@user)
      redirect_to user_path(current_user)
    end 
  end
  
  def current_user?(user)
     user == current_user
  end

def destroy
    session[:user_id] = nil
    @user = User.find(params[:id])
    @user.destroy
end
end


