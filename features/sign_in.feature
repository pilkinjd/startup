Feature: logging in a user and logging them out

  @wip
  Scenario: Logging in
    Given there are some users
    When the user goes to log in
    And they complete the login form
    Then they should see they are logged in
