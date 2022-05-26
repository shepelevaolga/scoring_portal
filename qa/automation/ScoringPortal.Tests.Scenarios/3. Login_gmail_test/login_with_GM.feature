Feature: 1. sign in with user's Google Account

Background:
    Given Google Account Login 'login' and password 'password'
    And CSV file 'test'


Scenario: 1.01 Successfull sign in
    Given user clicked on 'sign in with google' button on scoring welcome page
    And user entered 'login' in google account field
    And user clicked on 'Next' button
    And user entered 'password' in password field
    When user presses 'Next' button
    Then files upload field is shown
   


Scenario: 1.02 Use of application functionality
    Given user signed in with Google Account 
    And files upload field is shown
    When user uploads 'test' file
    Then file data is shown
    


Scenario: 1.03 Google account field empty (no google account)  
    Given user clicked on 'sign in with google' button on scoring welcome page
    And user left google account field empty   
    When user presses 'Next' button
    Then error message is shown
    And same sign in page is opened
    


Scenario: 1.04 scoring welcome page contains only google sign in form
    Given scoring welcome page inteface
    Then only one sign form is shown - Google


Scenario: 1.05 Sign in with wrong password
    Given user clicked on 'sign in with google' button on scoring welcome page
    And user entered 'login' in google account field
    And user clicked on 'Next' button
    And user entered wrong password field
    When user presses 'Next' button
    Then  error message "Wrong password" is shown
    And same sign in page is opened