class Caller

def find_by_category(categoria)
	  
  if categoria=="Elettronica"
    @id="43304"
  
 elsif categoria=="Moda"
  @id="261503"
 
 elsif categoria=="Sport"
   @id="62134"
 
 elsif categoria=="Casa"
  @id="13595"
  
 elsif categoria=="Giardinaggio"
 
  @id="260175"
	  
	  end
	  
request_body = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<findItemsByCategoryRequest xmlns="http://www.ebay.com/marketplace/search/v1/services">
  <categoryId>#{@id}</categoryId>
  <paginationInput>
    <entriesPerPage>8</entriesPerPage>
  </paginationInput>
</findItemsByCategoryRequest>
XML

    sandbox_url = "https://svcs.sandbox.ebay.com/services/search/FindingService/v1"

    response = HTTParty.post(
      sandbox_url,
      body: request_body,
      headers: {
        'X-EBAY-SOA-RESPONSE-DATA-FORMAT' => 'JSON',
        "X-EBAY-SOA-SECURITY-APPNAME" => ENV["API_KEY"],
        "X-EBAY-SOA-OPERATION-NAME" => "findItemsByCategory"
      }
    )

    # Gestisci la risposta e mostra i risultati nella tua vista
  res = JSON.parse(response.body)
  res =  res["findItemsByCategoryResponse"][0]["searchResult"][0]["item"]
  return res

end









    def cerca(keyword, sort_order,minprice,maxprice,instaexp,place,minf,maxtime)
        @keyword=keyword
        @sort_order=sort_order
        @minprice=minprice
        @maxprice=maxprice
        @instaexp=instaexp
        @place=place
        @minf=minf


        if @place==""
            @place="US"
          end
          if @instaexp==0
            @instaexp=maxtime
          end

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
    res=res["findItemsByKeywordsResponse"][0]["searchResult"][0]["item"]
    
    return res
    end

end