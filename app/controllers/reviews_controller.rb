require 'cancancan'


class ReviewsController < ApplicationController
	load_and_authorize_resource
before_action :f_user
before_action :f_review , only: [:destroy, :edit, :update,]


	def new
		@user_id=params[:user_id]
		@negozio=params[:negozio]
		@item_id=params[:item_id]
		@title=params[:title]
		@review=Review.new
	end
		
	
	def create
		@review= Review.new(review_params)
		if @review.save
			flash[:notice] = 'review saved successfully'
			redirect_to user_path(current_user)
		else 
			puts @review.errors.full_messages
		    flash[:alert] = 'Errore'
		end
	end
	def edit
		@titolo=@review.title
	end
		
	def update
		if @review.update(review_params)
			if @user.moderator? || @user.admin?
				redirect_to user_path(@review.user_id)
			else
			redirect_to user_path(@user.id)
		    end
		else 
			render "edit"
		end
	end
	
	def destroy

		@review.destroy
		redirect_to user_path(@user)
	end
	
	private
	
	def review_params
		params.require(:review).permit(:title,:rating, :comment, :item_id, :negozio, :user_id)
	end
	
	def f_user
		@user=User.find(params[:user_id])
	end
	
	def f_review
		@review=Review.find(params[:id])
	end
end

