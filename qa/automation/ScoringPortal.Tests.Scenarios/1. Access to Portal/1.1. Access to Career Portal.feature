Feature: 1. Signing in with Google account

Background:
    Given User goes to https://qa.ddso-spot.quantori.com site
    And User has managed Google account
          
Scenario: 1.1.1  User opens email page when not authorizied in Google account
    When User clicks on "Sign in with Google" button
    Then Google authorization form is opened
    And User sees 'Email or phone number' field empty
    
Scenario: 1.1.2 User tries to sign in with managed email
    Given User has managed Google account credentials:
    | email         | anastasiadmitrieva@gmail.com
    | phone number  | +375297773322
    | password      | w763e!6&_N
    When User eneters 'anastasiadmitrieva@gmail.com' in 'Email or phone number' field
    And User clicks on 'Next' button
    Then next authorization form is opened
    And User sees 'Email your password' field empty

Scenario: 1.1.3 User tries to sign in with managed phone number
    When User eneters '+375297773322' in 'Email or phone number' field
    And User clicks on 'Next' button
    Then next authorization form is opened
    And User sees 'Email your password' field empty

Scenario: 1.1.4 User tries to sign in email or phone nubmer empty
    Given User leaves 'Email or phone number' field empty
    When User clicks on 'Next' button
    Then 'Email or phone number' field marked red
    And User sees 'Enter email or phone number' error message

Scenario: 1.1.5 User tries to sign in non-existing email
    Given User has invalid Google credentials:
    | email         | a7%@gmail.com
    When User eneters 'a7%@gmail.com' in 'Email or phone number' field
    And User clicks on 'Next' button
    Then 'Email or phone number' field marked red
    And User sees 'Couldn't find your Google Account' error message

Scenario: 1.1.6 User tries to sign in non-existing phone number
    Given User has invalid Google credentials:
    | phone number  | +37577
    When User eneters '+37577' in 'Email or phone number' field
    And User clicks on 'Next' button
    Then 'Email or phone number' field marked red
    And User sees 'Enter a valid email or phone number' error message

Scenario: 1.2.1  User opens email page when authorizied in Google account
    When User clicks on "Sign in with Google" button
    Then Google authorization form is opened
    And User sees list of managed Google emails

Scenario: 1.2.2 User tries to sign in with managed Google email
    Given User has a list of managed Google emails:
    | email         | anastasiadmitrieva@gmail.com
    | email         | ray_done@mail.ru
    | email         | u333eva@yahoo.com
    When User clicks on email from the list
    Then next authorization form is opened
    And User sees 'Email your password' field empty

Background:
    Given User enters 'anastasiadmitrieva@gmail.com' as managed email
    Then User sees 'Email your password' field empty

Scenario: 1.3.1 User tries to sign in with valid password
    When User eneters 'w763e!6&_N' in 'Email your password' field
    And User clicks on 'Next' button
    Then User sees the Quantori Scoping page
    
Scenario: 1.3.2 User tries to sign in with empty password
    When User clicks on 'Next' button
    Then 'Enter your password' field is marked red
    And User sees 'Enter a password' error message

Scenario: 1.3.3 User tries to sign in with invalid password
    Given User has invalid Google credentials:
    | password | 3!
    When User enters '3!' in 'Enter your password' field
    And User clicks on 'Next' button
    Then 'Enter your password' field is marked red
    And User sees 'Wrong password. Try again or click Forgot password to reset it.' error message

Scenario: 1.3.4 User logs out the Quantori Scoping
    Given User is signed in the Quantori Scoping
    When User clicks on 'Log out' button
    Then User sees initial Google authorization form

Scenario: 1.3.5 User tries to sign in wihtout password after being logged out 
    Given User is on initial Google authorization form
    When User clicks on 'Sign in with Google' button
    And User sees the list of managed Google emails
    And User clicks on email from the list
    Then User sees the Quantori Scoping page