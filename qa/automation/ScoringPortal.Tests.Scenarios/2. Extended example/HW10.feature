Feature: 1.1. Sign in to App with Google account

	Scenario: Sign in with Google account with valid credentials
	Given user is on https://qa.ddso-spot.quantori.com/ page
	When user hits "Sign in with Google" button
	And user is taken to "Google account page"
	And "Google account" authentication is granted
	Then user is signed in to the app
	And user is taken to "Dataset" page of the app

	Scenario: Sign in with Google account with valid credentials
	Given user is on https://qa.ddso-spot.quantori.com/ page
	When user hits "Sign in with Google" button
	And user is taken to "Google account page"
	And "Google account" authentication is not granted
	Then user stays on "Google account" page
	