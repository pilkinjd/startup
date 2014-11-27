Feature: Access control to pages

  Background:
    Given there are some users

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
