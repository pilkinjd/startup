Feature: managing the users

  Background:
    Given there are some users
    And I am logged in

  Scenario: Showing all the users
    When I go to the users page
    Then I should see the users

  Scenario: adding a new user
    When I go to the users page
    And  I fill in the new user form
    Then I should see the new user is created

  Scenario: editing a user
    When I go to the users page
    And  I edit an existing user
    Then I should see the user has been updated

  Scenario: deleting a user
    Given I am logged in as an admin
    When I go to the users page
    And  I delete an existing user
    Then I should see the user has been deleted

  Scenario: we cannot delete ourselves
    Given I am logged in as an admin
    When I go to the users page
    And I try and delete myself
    Then I should see this is not allowed
