Feature: managing the users

  Scenario: Showing all the users
    Given there are some users
    When I go to the users page
    Then I should see the users

  Scenario: adding a new user
    When I go to the users page
    And  I fill in the new user form
    Then I should see the new user is created

  Scenario: editing a user
    Given there are some users
    When I go to the users page
    And  I edit an existing user
    Then I should see the user has been updated

    @wip
  Scenario: deleting a user
    Given there are some users
    When I delete an existing user
    Then I should see the user has been deleted
