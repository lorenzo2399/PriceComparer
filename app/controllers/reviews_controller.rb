require 'cancancan'


class ReviewsController < ApplicationController
	load_and_authorize_resource
before_action :f_user
before_action :f_review , only: [:destroy, :edit, :update,]


	def new
		@item_id=params[:item_id]
		@title=params[:title]
		@review=Review.new
	end
		
	
	def create
		@review= Review.new(review_params)
		@review.user_id=@user.id
		if @review.save
			flash[:notice] = 'review saved successfully'
			redirect_to user_path(current_user)
		else 
		    flash[:alert] = 'Errore'
		end
	end
	def edit
		@titolo=@review.title
	end
		
	def update
		if @review.update(review_params)
			redirect_to root_path
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
		params.require(:review).permit(:title,:rating, :comment, :item_id)
	end
	
	def f_user
		@user=User.find(params[:user_id])
	end
	
	def f_review
		@review=Review.find(params[:id])
	end
end

