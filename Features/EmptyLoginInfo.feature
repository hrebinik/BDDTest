
Feature: Login App

@NoResults
Scenario: Login with non empty credentials

    Given the app is running
    
    When I enter "test" in the name text fields
    Then I enter "test" in the last name text fields
    Then I enter "test@gmail.com" in the email text fields
    Then I enter "123456789" in the password text fields
    Then I press the button
    Then I see an alert with title "Great"
