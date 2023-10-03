require "httparty"
require "json"
require "dotenv-rails"



class PagesController < ApplicationController
  def home
     @users = User.all
  end
  
  def search
  @users=User.all
  @keyword=params[:keyword]



# URL dell'endpoint dell'API sandbox di eBay
sandbox_url = "https://svcs.sandbox.ebay.com/services/search/FindingService/v1"

request_body=<<-XML
<?xml version="1.0" encoding="UTF-8"?>
   <findItemsByKeywordsRequest xmlns="http://www.ebay.com/marketplace/search/v1/services">
  <keywords>#{@keyword}</keywords>
  <paginationInput>
    <entriesPerPage>2</entriesPerPage>
  </paginationInput>
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

@search_results=JSON.parse(response)


end
end
