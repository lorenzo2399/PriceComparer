require 'cancancan'

class MessagesController < ApplicationController
  load_and_authorize_resource
  before_action :f_user, except: [:admin_board]
  

  
  def new
    @user_id=params[:user_id]
		@content=params[:content]
    @message = Message.new
  end

  def create
    @message= Message.new(message_params)
    if @message.save
      redirect_to root_path, notice: 'Messaggio inviato con successo!'
    else
      render :new
    end
  end

  def destroy
    if  @message.destroy
      flash[:success] = "Richiesta risolta con successo."
    else
      flash[:error] = "Impossibile risolvere richiesta."
    end
     
    redirect_to admin_board_path
  end
 

  def f_user
  @user=User.find(params[:user_id])
end

  private

  def message_params
    params.require(:message).permit(:content,:user_id)
  end

  
end

