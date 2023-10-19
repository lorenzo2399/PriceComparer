Feature: As an admin i want to create a mod, delete it, delete a user and delete a user's review

Background: 
    Given I am a admin
    And I am on the Sign in Page admin
    When I insert email email and password admin
    And I click button "Log in" admin
    Then I am redirected to Home Page admin
    

Scenario: I want to delete a User
    Given there is a user
    And I m on admin board
    When i click delete for a user
    Then i should not see the user
    And the user should be removed from database

Scenario: make a user mod
    Given there is a user not moderator
    And I m on admin board
    When i click make mod for a user
    Then the user should be a moderator

Scenario: remove mod 
    Given there is a moderator user
    And I m on admin board
    When i click remove mod for a user
    Then the user should not be a moderator

Scenario: Delete Review
    Given there is a user and has a review
    And I am on admin board
    When i click on profilo of a user
    Then I should be redirected to user s profilo
    When i click on elimina review button
    Then the review should disappear from db