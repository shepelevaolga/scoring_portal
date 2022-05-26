Feature: 1.1.1.1 Sign_in_with_users_Google_Account
Background: 
    Given user went on 'https://qa.ddso-spot.quantori.com/' page
    And user clicked on 'Sign In with Google' button
    And there is a registered account with email 'login111@gmail.com' and phone number '+7nnnnnnnnnn' and password 'password1'

Scenario Outline: 1.1.1.1_01 Signing in with valid email and password in different browsers
    Given there are no suggested accounts in the browser
    And user uses <browser>
    When user types 'login111@gmail.com' in the 'Email or phone' field
    And user clicks the 'Next' button
    And user types 'password1' in the 'Enter your password' field
    And user clicks the 'Next' button
    Then the main page opens
    Examples:
    |browser|
    Google Chrome
    Microsoft Edge
    Tor Browser
    
Scenario Outline: 1.1.1.1_02 Signing in with suggested google account
    Given there is a saved google account in the browser
    When user clicks on the suggested account button (login111)
    Then the main page opens

Scenario Outline: 1.1.1.1_03 Signing in with invalid password
    Given there are no suggested accounts in the browser
    When user types 'login111@gmail.com' in the 'Email or phone' field
    And user clicks the 'Next' button
    And user types 'password123' in the 'Enter your password' field
    And user clicks the 'Next' button
    Then 'Wrong password. Try again or click Forgot password to reset it.' error appears
    And the field goes empty
    And the red outline of the field appears

Scenario Outline: 1.1.1.1_04 Signing in with empty password field
    Given there are no suggested accounts in the browser
    When user types 'login111@gmail.com' in the 'Email or phone' field
    And user clicks the 'Next' button
    And user clicks the 'Next' button
    Then 'Enter a password' inscription goes red
    And the red outline of the field appears

Scenario Outline: 1.1.1.1_05 Signing in with non-existent email
    Given there are no suggested accounts in the browser
    When user types 'login1@gmail.com' in the 'Email or phone' field
    And user clicks the 'Next' button
    Then 'Couldn't find your Google account' error appears
    And the field goes empty
    And the red outline of the field appears

Scenario Outline: 1.1.1.1_06 Signing in with non-existent phone number
    Given there are no suggested accounts in the browser
    When user types '+71111111111' in the 'Email or phone' field
    And user clicks the 'Next' button
    Then 'Couldn't find your Google account' error appears

Scenario Outline: 1.1.1.1_07 User clicks on 'Forgot email?'  
    Given there are no suggested accounts in the browser
    When user clicks on 'Forgot email?' 
    Then 'Find your email' page opens

Scenario Outline: 1.1.1.1_08 User clicks on 'Forgot password?'  
    Given there are no suggested accounts in the browser
    When user types 'login111@gmail.com' in the 'Email or phone' field
    And user clicks the 'Next' button
    And clicks on 'Forgot password?'
    Then 'Account recovery' page opens

Scenario Outline: 1.1.1.1_09 User clicks on 'Forgot password?'  
    Given there are no suggested accounts in the browser
    When user types 'login111@gmail.com' in the 'Email or phone' field
    And user clicks the 'Next' button
    And clicks on 'Forgot password?'
    Then 'Account recovery' page opens

#I perceived account recovery as separate feature so here I only test the buttons

Scenario Outline: 1.1.1.1_10 User goes back after clicking 'Next' button
    Given there are no suggested accounts in the browser
    When user types 'login111@gmail.com' in the 'Email or phone' field
    And user clicks the 'Next' button
    And user clicks on 'to go back' arrow
    Then 'Sign in' page opens
    And the 'email or phone number' field is still filled

Scenario Outline: 1.1.1.1_11 User goes back after clicking 'Next' button on password page
    Given there are no suggested accounts in the browser
    When user types 'login111@gmail.com' in the 'Email or phone' field
    And user clicks the 'Next' button
    And user clicks on 'to go back' error
    Then 'Sign in' page opens
    And the 'email or phone number' field is still filled
    







