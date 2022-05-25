Feature: 1.1. Sign in to App with Google account

Scenario: Sign in with Google account granted
	Given user is on https://qa.ddso-spot.quantori.com/ page
	When user hits "Sign in with Google" button
	And user is taken to "Sign in with Google" page
	And "Google account" authentication is granted by Google
	Then user is signed in to the app
	And user is taken to "Dataset" page of the app

Scenario: Sign in with Google account is not granted
	Given user is on https://qa.ddso-spot.quantori.com/ page
	When user hits "Sign in with Google" button
	And user is taken to "Sign in with Google" page
	And "Google account" authentication is not granted by Google
	Then user sign in to the app is denied
	And user stays on "Sign in with Google" page