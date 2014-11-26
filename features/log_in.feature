Feature: logging in a user and logging them out

  Background:
    Given there are some users

  Scenario: Logging in
    When the user goes to log in
    And they complete the login form
    Then they should see they are logged in

  Scenario: loggin out
    Given I am logged in
    When I log out
    Then I should see the user is logged out
