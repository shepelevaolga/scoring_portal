Feature: 1.1. Sign in to App with Google account

Background:
    Given user is on https://qa.ddso-spot.quantori.com/ page
	And user's Google account exists with valid credentials:
	    | Email                 | Password | Phone         |
        | yana.aleeva@gmail.com | Abcd1234 | +393200238290 |
    

Scenario: 1.1_01 Sign in with Empty Email
	Given no user's Google account is registered on device
	When user hits "Sign in with Google" button
	And user leaves "Email or phone" text field empty
	And user clicks "Next" button
	Then “! Enter an email or phone number” error message appears under "Email or phone" text field marked red

Scenario: 1.1_02 Sign in with Google account with valid credentials
	Given no user's Google account is registered on device
	When user hits "Sign in with Google" button
	And user fills in "yana.aleeva@gmail.com" in "Email or phone" text field
	And user clicks "Next" button
	And user fills in "Abcd1234" in "Enter your password" text field
	And user clicks "Next" button
	Then User is signed in to the app
	And User is taken to "Dataset" page of the app

Scenario: 1.1_03 Sign in with valid Password swapped with Email
	Given no user's Google account is registered on device
	When user hits "Sign in with Google" button
	And user fills in "Abcd1234" in "Email or phone" text field
	And  user clicks "Next" button
	Then "! Couldn’t find your Google Account" error message appears under "Email or phone" text field marked red

Scenario: 1.1_04 Sign in with invalid phone number
	Given no user's Google account is registered on device
	When user hits "Sign in with Google" button
	And  user fills in "+393200238291" in "Email or phone" text field
	And  user clicks "Next" button
	Then "! Couldn’t find your Google Account. Try using your email address instead" error message appears under "Email or phone" text field marked red

	
Scenario: 1.1_05 Sign in with invalid phone number format
	Given no user's Google account is registered on device
	When user hits "Sign in with Google" button
	And  user fills in "3200238291" in "Email or phone" text field
	And  user clicks "Next" button
	Then “! Enter a valid email or phone number” error message appears under "Email or phone" text field marked red

	
Scenario: 1.1_06 Sign in with valid phone number
	Given no user's Google account is registered on device
	When user hits "Sign in with Google" button
	And  user fills in "+393200238290" in "Email or phone" text field
	And user clicks "Next" button 
	And  user fills in "Abcd1234" in "Enter your password” text field
	And  user clicks "Next" button
	Then user is signed in to app
	And user is taken to "Dataset" page of the app

Scenario: 1.1_07 Sign in with invalid password
	Given no user's Google account is registered on device
	When user hits "Sign in with Google" button
	And  user fills in "yana.aleeva@gmail.com" in "Email or phone" text field
	And user clicks "Next" button 
	And  user fills in "parol" in ‘Enter your password” text field
	And  user clicks "Next" button
	Then “! Wrong password. Try again or click Forgot password to reset it.” Error message appears under "Enter your password" text field

Scenario: 1.1_08 Sign in with empty password
	Given no user's Google account is registered on device
	When user hits "Sign in with Google" button
	And  user fills in "yana.aleeva@gmail.com" in "Email or phone" text field
	And user clicks "Next" button
	And  user leaves "Enter your password” text field empty
	And  user clicks "Next" button
	Then “! Enter a password” Error message appears under "Enter your password" text field marked red

Scenario: 1.1_09 Sign in with invalid Email for Google account
	Given no user's Google account is registered on device
	When user hits "Sign in with Google" button
	And  user fills in "yana.aleeva2@gmail.com" in "Email or phone" text field
	And User clicks "Next" button
	Then “! Couldn’t find your Google Account” error message appears under "Email or phone" text field marked red

Scenario: 1.1_10 Sign in when only user's Google account is signed in on device
	Given user's Google account is signed in on device
	When user hits "Sign in with Google" button
	Then user is signed in the app
	And user is taken to "Dataset" page of the app


Scenario: 1.1_11 Sign in when user's two Google accounts are signed in on device
	Given user's another Google account exists with valid credentials:
	    | Email                          | Password  | Phone         |
        | yana.aleeva@quantori.academy   | Abcd1235  | +393200238292 | 
	And both user's Google accounts are signed in on device
	When user hits "Sign in with Google" button
	And  user clicks on "yana.aleeva@quantori.academy" in "Choose an account" list
	Then user is signed in the app
	And user is taken to "Dataset" page of the app

Scenario: 1.1_12 Sign in when user with Google account is signed out on device
	Given user's Google account is signed out on device
	When user hits "Sign in with Google" button
	And user clicks "yana.aleeva@gmail.com" in "Choose an account" list 
	And  user fills in "Abcd1234" in "Enter your password” text field
	And user clicks "Next"button
	Then user is signed in to the app
	And user is taken to ‘Dataset’ page of the app


Scenario: 1.1_13 Sign in with adding the Google account
	Given user with Google account is signed out on device
	And user's another Google account exists with valid credentials:
	    | Email                          | Password  | Phone         |
        | yana.aleeva@quantori.academy   | Abcd1235  | +393200238292 |  
	And  user's "yana.aleeva@quantori.academy" account is not registered on device
	When user hits "Sign in with Google" button
	And user clicks "Use another account" in "Choose an account" list
	And user fills in "yana.aleeva@quantori.academy" in "Email or phone" text field
    And  user clicks "Next" button
    And user enters "Abcd1235" in "Enter your password" text field
    And user clicks "Next" button
   Then user is signed in
   And user is taken to "Dataset" page

    
Scenario: 1.1_14 Sign in with not a Google account
	Given no user's Google account is registered on device
	And  user account with valid credentials exists:
	    | Email              | Password | 
        | yanaaleeva@mail.ru | Abcd1234 |
	When user hits "Sign in with Google" button
	And  user fills in "yanaaleeva@mail.ru" in "Email or phone" text field
	And  User clicks "Next" button
    And  User enters "Abcd1234" in "Enter your password" text field
    And  User clicks "Next" button
    Then “! Wrong password. Try again or click Forgot password to reset it” error message appears under "Enter your password" text field marked red
	
	

