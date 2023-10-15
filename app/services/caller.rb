class Caller

    def cerca(keyword, sort_order,minprice,maxprice,instaexp,place,minf)

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
            @instaexp=30
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
    puts res
    res=res["findItemsByKeywordsResponse"][0]["searchResult"][0]["item"]
    puts res
    return res
    end

end