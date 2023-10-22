require 'cancancan'

class ResearchesController < ApplicationController
	load_and_authorize_resource

before_action :f_user
before_action :f_research , only: [:destroy]

	def new
		@user_id=params[:user_id]
		@item_id=params[:item_id]
		@price=params[:price]
        @location=params[:location]
        @url=params[:url]
        @title=params[:title]
		@feed=params[:feed]
		@time=params[:time]
		@research=Research.new
	end
		
	

	def ordina
		@results = Research.where(user_id: @user.id).order(time: :desc)
	end
      
	def create
		@research= Research.new(research_params)
		if @research.save
			flash[:notice] = 'review saved successfully'
			redirect_to user_path(current_user)
		else 
			flash[:alert] = 'Errore'
		end
	end
	
	def feedordina
		@fresults = Research.where(user_id: @user.id).order(feed: :desc)
	end
	
	def destroy
		@research.destroy
		@fresults = Research.where(user_id: @user.id).order(feed: :desc)

		@results = Research.where(user_id: @user.id).order(time: :desc)

		redirect_to user_path(@user)
	end
	
	private
	
	def research_params
		params.require(:research).permit(:title,:price, :location, :item_id, :url, :feed, :time, :user_id)
	end
	
	def f_user
    	@users=User.all
		@user=User.find(params[:user_id])
	end
	
	def f_research
		@research=Research.find(params[:id])
	end
end
