Feature: As a moderator i want to delete a user's review and a user

Background: 
    Given I am a modeator
    And I am on the Sign in Page moderator
    When I insert email email and password moderator
    And I click button "Log in" moderator
    Then I am redirected to Home Page moderator

Scenario: I want to delete a User
    Given there is a user in the site
    And I m on moderator board
    When i click delete for this user
    Then i should not see the user anymore
    And the user should be removed from database also

Scenario: Modify a Review by moderator
    Given there is a user and has a eview
    And I m on moderato board
    When i click on the user profile  
    Then i am redirect to the page "http://127.0.0.1:3000/users/2/"
    When i click modify button  on the page 
    Then i am redirect to page edit page
    And i fill the form with 3 and "not bad" also
    When I press the button Invia also
    And i should not see 4 rating anymore
    And i should not see "great" rating anymore
    And i should see 3 rating instead
    And i should see "not bad"  instead