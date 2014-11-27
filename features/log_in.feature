Feature: logging in a user and logging them out

  Background:
    Given there are some users

  Scenario: Logging in
    When the user goes to the log in page
    And they complete the login form
    Then they should see they are logged in

  Scenario: loggin out
    Given I am logged in
    When I log out
    Then I should see the user is logged out

  Scenario: accessing protected pages without logging in
    When I go to a protected page
    Then I should be redirected to the login page

  Scenario: accessing Admin only pages
    Given I am logged in as an admin
    When I go to an admin only page
    Then I should see the admin only page

  @wip
  Scenario: trying to access admin pages as mere mortal
    Given I am logged in
    When I go to an admin only page
    Then I should see I am not authorised
