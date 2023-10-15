require 'cancancan'

class UsersController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  
 
  def show
    @user = User.find(params[:id])
  end

  def correct_user
    @user = User.find_by(params[:id])
    unless current_user?(@user)
      redirect_to user_path(current_user)
    end
  end

  def admin_board
    @messages=Message.all
    @reviews=Review.all
    @researches=Research.all
    @users=User.all
  end

def remove_mod
  @user = User.find(params[:id])
  @user.role=0
  @user.save
  puts @user.role
  redirect_to admin_board_path
end

  def set_mod
    @user = User.find(params[:id])
    @user.role=2
    @user.save
    puts @user.role
    redirect_to admin_board_path

  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "Utente eliminato con successo."
    else
      flash[:error] = "Impossibile eliminare l'utente."
    end
    redirect_to root_path
  end

  def f_review
    @review = Review.find(params[:id])
  end
  
end


