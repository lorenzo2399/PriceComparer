require "httparty"
require "json"
require "dotenv-rails"
require 'cancancan'
require "caller"

class PagesController < ApplicationController

  def home
     @users = User.all
  end

  def cambia 
  locale = params[:locale].to_sym
  I18n.locale = locale
  session[:select_l] = I18n.locale
  redirect_to root_path
end
  

def search
    @users=User.all
    @user=current_user

    if current_user 
      reviews = Review.where(user_id: @user.id).pluck(:item_id)
      @reviews_item_id = reviews
      researches = Research.where(user_id: @user.id).pluck(:item_id)
      @researches_item_id = researches
      cercaitem=Research.where(user_id: @user.id).pluck(:item_id, :price)
      @resitem=cercaitem
    end

    chiamata = Caller.new
    @search_results =chiamata .cerca(params[:keyword], params[:sort_order], params[:minprice].to_i, params[:maxprice].to_i,params[:instaexp].to_i, params[:place],params[:minf])
    
  

end
end
