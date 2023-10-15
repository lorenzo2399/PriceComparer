require "httparty"
require "json"
require "dotenv-rails"
require 'cancancan'


class PagesController < ApplicationController

  def home
     @users = User.all
  end


  def search
    @users=User.all
    @user=current_user
    @keyword=params[:keyword]

    if current_user 
      reviews = Review.where(user_id: @user.id).pluck(:item_id)
      @reviews_item_id = reviews
      researches = Research.where(user_id: @user.id).pluck(:item_id)
      @researches_item_id = researches
      cercaitem=Research.where(user_id: @user.id).pluck(:item_id, :price)
      @resitem=cercaitem
    end

    
    @order=params[:sort_order]
    @minprice=params[:minprice]
    @maxprice=params[:maxprice]
    @instaexp=params[:instaexp].to_i
    @place=params[:place]
    if @place==""
      @place="US"
    end
    if @instaexp==0
      @instaexp=30
    end
    @minf=params[:minf]
    
    @minp=@minprice.to_i
    @map=@maxprice.to_i


    # URL dell'endpoint dell'API sandbox di eBay
    sandbox_url = "https://svcs.sandbox.ebay.com/services/search/FindingService/v1"
    
    request_body=<<-XML
<?xml version="1.0" encoding="UTF-8"?>
<findItemsByKeywordsRequest xmlns="http://www.ebay.com/marketplace/search/v1/services">
  <keywords>#{@keyword}</keywords>
  <outputSelector>SellerInfo</outputSelector>
  <itemFilter>
    <name>AvailableTo</name>
    <value>#{@place}</value>
  </itemFilter>
  <itemFilter>
    <name>MaxHandlingTime</name>
    <value>#{@instaexp}</value>
  </itemFilter>
  <itemFilter>
    <name>FeedbackScoreMin</name>
    <value>#{@minf}</value>
  </itemFilter>
  <itemFilter>
    <name>MaxPrice</name>
    <value>#{@maxprice}</value>
    <paramName>Currency</paramName>
    <paramValue>USD</paramValue>
  </itemFilter>
  <itemFilter>
    <name>MinPrice</name>
    <value>#{@minprice}</value>
    <paramName>Currency</paramName>
    <paramValue>USD</paramValue>
  </itemFilter>
  <paginationInput>
    <entriesPerPage>8</entriesPerPage>
  </paginationInput>
  <sortOrder>#{@order}</sortOrder>
</findItemsByKeywordsRequest> 
XML


    

   response = HTTParty.post(
     sandbox_url,
     body: request_body,
     headers: {
     'X-EBAY-SOA-RESPONSE-DATA-FORMAT' => 'JSON',
     "X-EBAY-SOA-SECURITY-APPNAME" =>ENV["API_KEY"],
           "X-EBAY-SOA-OPERATION-NAME" => "findItemsByKeywords"
           }
   )

res=JSON.parse(response)

@search_results = res["findItemsByKeywordsResponse"][0]["searchResult"][0]["item"]
  

end
end
