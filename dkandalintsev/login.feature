Feature: 1. Signing in with Google account

Scenario: 1.01 Sign in page is available for user
    Given user is on the https://qa.ddso-spot.quantori.com/ page
    When user clicks "Sign in with Google" button
    Then https://accounts.google.com/ authorization page opens

Scenario: 1.02 User has one saved Google account on device and tries to sign in
    Given user is signed in with one Google account on google.com in the web browser
    And users's Google accounts have this credentials:
        | email address               | phone number | password |
        | testkandalintsev@gmail.com  | +79819139630 | Test123! |
    And user is on the https://qa.ddso-spot.quantori.com/ page
    When user clicks "Sign in with Google" button
    Then user is on the Quantori Scoring main page

Scenario: 1.03 User has multiple saved Google accounts on device and tries to sign in
    Given user is signed in with two Google accounts on google.com in the web browser
    And users's Google accounts have this credentials:
        | email address               | phone number | password |
        | testkandalintsev@gmail.com  | +79819139630 | Test123! |
        | testkandalintsevd@gmail.com | +79646149307 | Test123! |
    And user is on the https://qa.ddso-spot.quantori.com/ page
    When user clicks "Sign in with Google" button
    Then list of user's existing Google accounts is shown

Scenario: 1.04 User signs in with multiple saved and logged in Google accounts
    Given user has logged in Google accounts in browser
    And user is on the https://qa.ddso-spot.quantori.com/ page
    And user clicked "Sign in with Google" button
    When user clicks on one of his Google accounts in the list
    Then user is on the Quantori Scoring main page

Scenario: 1.05 User has saved Google account, but signed out
    Given user is logged out of his Google account
    And user is on the https://qa.ddso-spot.quantori.com/ page
    And user clicked "Sign in with Google" button
    When user clicks on one of his Google accounts in the list
    Then user needs to fill in password field for his Google account

Scenario: 1.06 User signs in with saved and logged out Google account
    Given user is logged out of his Google account
    And user is on the https://qa.ddso-spot.quantori.com/ page
    And user clicked "Sign in with Google" button
    And user filled in the password field with valid <password>
    When user clicks "Next"
    Then user is on the Quantori Scoring main page

Scenario: 1.07 User does not use right password for saved and logged out Google account
    Given user is logged out of his Google account
    And user is on the https://qa.ddso-spot.quantori.com/ page
    And user clicked "Sign in with Google" button
    And user filled in the password field with invalid <password>
    When user clicks "Next"
    Then user sees that password input is red
    And user has "Wrong password. Try again or click ‘Forgot password’ to reset it." message uder the password input

Scenario: 1.08 User checks if signing in without saved Google accounts is possible
    Given user does not have saved Google accounts in browser
    And user is on the https://qa.ddso-spot.quantori.com/ page
    When user clicks "Sign in with Google" button
    Then user sees "Email or phone" input for Google account

Background:
    Given user does not have saved Google accounts in browser
    And user is on the https://qa.ddso-spot.quantori.com/ page
    And user clicks "Sign in with Google" button

Scenario: 1.09 User tries to sign in with non-existing email
    Given  user fills in "Email or phone" input with <non-existing email>
    Examples:
        | non-existing email |
        | ifmnvme@gmail.com  |
    When user clicks "Next"
    Then email input is outlined with red color
    And user sees "Couldn't find your Google account" message under the input

Scenario: 1.10 User tries to sign in with non-existing phone number
    Given user fills in "Email or phone" input with <non-existing phone>
    Examples:
        | non-existing phone |
        | +79819139699       |
    When user clicks "Next"
    Then email input is outlined with red color
    And user sees "Couldn't find your Google account. Try using your email address instead" message under the input

Scenario: 1.11 User tries to sign in with incorrect password
    Given user fills in "Email or phone" input with <email address>
    And user clicks "Next"
    And user fills in "Enter your password" input with <incorrect password>
    Examples:
        | incorrect password |
        | Trewqasdf4321?     |
    When user clicks "Next"
    Then password input is outlined with red color
    And user sees "Wrong password. Try again or click ‘Forgot password’ to reset it." message under the input

Scenario: 1.12 User signs in with correct email and password
    Given user fills in "Email or phone" input with <email address>
    And user clicks "Next"
    And user fills in "Enter your password" input with <password>
    When user clicks "Next"
    Then user is on the Quantori Scoring main page

Scenario: 1.13 User does not fill email input
    Given user leaves "Email or phone" input empty
    When user clicks "Next"
    Then email input is outlined with red color
    And user sees "Enter an email or phone number" message under the input

Scenario: 1.14 User does not fill password input
    Given user fills in "Email or phone" input with <email address>
    And user clicks "Next"
    And user leaves "Enter your password" input empty
    When user clicks "Next"
    Then password input is outlined with red color
    And user sees "Enter a password" message under the input

Scenario: 1.15 User tries to log in with another domain
    Given user fills in "Email or phone" input with <invalid data>
    Examples:
        | invalid data |
        | +73455829    |
        | kmegjbmp@rfg |
    When user clicks "Next"
    Then email input is outlined with red color
    And user sees "Enter a valid email or phone number" message under the input