Feature: 1.1. Sign in to App with Google account

Background:
	Given user is on https://qa.ddso-spot.quantori.com/ page
	And user's Google account exists with valid credentials:
		| Email                 | Password | Phone         |
		| yana.aleeva@gmail.com | Abcd1234 | +393200238290 |

Scenario: 1.1_01 Sign in with Google account with valid credentials
	Given no user's Google account is registered on device
	When user hits "Sign in with Google" button
	And user fills in "yana.aleeva@gmail.com" in "Email or phone" text field
	And user clicks "Next" button
	And user fills in "Abcd1234" in "Enter your password" text field
	And user clicks "Next" button
	Then user is signed in to app
	And user is taken to "Dataset" page of the app

Scenario: 1.1_02 Sign in with not a Google account
	Given no user's Google account is registered on device
	And  user account with valid credentials exists:
		| Email              | Password |
		| yanaaleeva@mail.ru | Abcd1234 |
	When user hits "Sign in with Google" button
	And  user fills in "yanaaleeva@mail.ru" in "Email or phone" text field
	And  user clicks "Next" button
	And  user enters "Abcd1234" in "Enter your password" text field
	And  user clicks "Next" button
	Then “! Wrong password. Try again or click Forgot password to reset it” error message appears under "Enter your password" text