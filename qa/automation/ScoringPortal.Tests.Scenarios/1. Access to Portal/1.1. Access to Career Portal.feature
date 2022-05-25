Feature: 1. Signing in with Google account

Background:
    Given User goes to https://qa.ddso-spot.quantori.com site
    And User has Google account with credentials:
    | email         | anastasiadmitrieva@gmail.com |
    | phone number  | +375297773322                |
    | password      | w763e!6&_N                   |
          
Scenario: 1.1.1  User opens email page when not authorized in Google account
    Given User is on initial https://qa.ddso-spot.quantori.com page
    When User clicks on "Sign in with Google" button
    Then User is redirected to authorization form
    
Scenario: 1.1.2 User tries to sign in with email
    Given User is on Google authorization page
    When User enters 'anastasiadmitrieva@gmail.com' in 'Email or phone number' field
    And User enters 'w763e!6&_N' in 'Password' field 
    And User clicks on 'Next' button
    Then User sees the Quantori Scoring page 
    
Scenario: 1.1.3 User tries to sign in with phone number
    Given User is on Google authorization page
    When User enters '+375297773322' in 'Email or phone number' field
    And User enters 'w763e!6&_N' in 'Password' field 
    And User clicks on 'Next' button
    Then User sees the Quantori Scoring page
    
Scenario: 1.1.4 User tries to sign in when already authorized in Google account
    Given User is on has Google authorization page
    And User sees 'anastasiadmitrieva@gmail.com' Google email
    When User clicks on email 
    And User enters 'w763e!6&_N' in 'Password' field 
    And User clicks on 'Next' button
    Then User sees the Quantori Scoring page
   
Scenario: 1.1.5 User logs out the Quantori Scoring
    Given User is signed in the Quantori Scoring
    When User clicks on 'Log out' button
    Then User sees the Quantori Scoring portal authorization page

Scenario: 1.1.6 User tries to sign in directly to the Quantori Scoring 
    Given User is logged out the Quantori Scoring
    And User is on the Quantori Scoring portal authorization page
    When User clicks on 'Sign in with Google' button
    And User sees the list of Google emails
    And User clicks on 'anastasiadmitrieva@gmail.com' email
    Then User sees the Quantori Scoring page

Scenario: 1.1.7 User tries to sign in with another Google account
    Given User is on has Google authorization page
    And User sees a list of Google emails:
    | email                       | password    |
    |anastasiadmitrieva@gmail.com |w763e!6&_N   |
    |ray_dab@mail.ru              |O*7weiufh    |
    |u333eva@yahoo.com            |37wYOBbo     |
    When User clicks on 'ray_dab@mail.ru'
    And User enters 'O*7weiufh' in 'Password' field
    Then User sees the Quantori Scoring page