Feature: As a registered user I want to do a research and sort results by a filter. I want to do
        a review of the product, modify it and i want to save a research.


Background:
    Given I am a registered User
    And I am on the Sign in Page
    When I insert email email and password 
    And I click button "Log in"
    Then I am redirected to Home Page

Scenario: Research by keyword and filter by price
    Given I am on the Home Page
    When I fill the keyword space with "car" 
    And I select the option filter "Prezzo più basso:"
    And i fill the Price min with 15 and Price max with 50
    And I press cerca button
    Then I should be on "http://127.0.0.1:3000/pages/search?keyword=car&commit=Cerca&minprice=15&maxprice=50&minf=1&place=&maxtime=30&sort_order=PricePlusShippingLowest"
    And I should see some results with name "car" in it
    And the results should be ordere by price

Scenario: Save Research
    Given I am on the Search Page 
    When I Click on Save link
    Then I am redirected to a "http://127.0.0.1:3000/users/1/researches/new"
    When I press Save button
    And I am redirected to "http://127.0.0.1:3000/users/1"
    Then i should see on my personal page "Harry"
    And i Research should be added to database

Scenario: Make a review
    Given I am on a Search Page   
    When I click on Review button
    Then I am redirected to review page "http://127.0.0.1:3000/users/1/reviews/new"
    And I fill the form with 4 and "great" comment
    When I press the submit button
    Then I am redirected to personal page "http://127.0.0.1:3000/users/1" 
    And i should see the Review "great" on personale page
    And i should see the rating 4 on personal page
    And A review should be added to database

Scenario: Modify a Review
    Given I have a review
    And i am on my personal page
    When i click modify button  
    Then i am redirect to "http://127.0.0.1:3000/users/1/reviews/1/edit"
    And i fill the form with 2 and "bad" 
    When I press the button Invia
    Then i m redirected to "http://127.0.0.1:3000/users/1"
    And i should not see 4 rating
    And i should not see "great" rating
    And i should see 2 rating
    And i should see "bad" comment


