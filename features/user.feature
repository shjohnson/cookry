Feature: User scenarios

  Scenario: A user is created correctly
    When a user creates a new account
    Then a profile is created for that user
    And the user is shown that profile

  Scenario: Creating a user with the same email address
    When a user creates a new account with an existing email
    Then an error message is returned saying 'That email address already exists'

  Scenario: Creating a user with missing parameters
    When a user creates a new profile with missing parameters
    Then an error message is returned saying 'Missing fields'

  Scenario: View an existing users profile that has been created
    When a user creates a new account
    When a user wishes to view their account
    Given the user is correctly authorised
    And the user is shown that profile

  Scenario: An authorised user will be able to update their profile and save
    When a user creates a new account
    And the user is shown that profile
    Then the user may be able to update their details
    And the user is shown the update details

