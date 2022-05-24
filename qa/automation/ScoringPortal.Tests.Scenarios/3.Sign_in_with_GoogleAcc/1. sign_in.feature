Feature: 3.1 Sign in with Google Account

Background:
	Given user turn on VPN with necessary config
	And go to https://qa.ddso-spot.quantori.com/

Scenario: 3.1_01 User has Google account
	Given User has a saved Google account
	When User press the button "Sign in with Google"
	And User select necessary Google account 
	Then the page with Quantori Scoring is opened

Scenario: 3.1_02 User doesn't have a saved Google account
	Given User has a google account but it isn't saved in the browser
	When User press the button "Sign in with Google"
	And User see the "Sign in to your Google account" field
	And User fills in all necessary information
	Then the page with Quantori Scoring is opened

Scenario: 3.1_03 User doesn't have any Google account
	Given User doesn't have any Google account
	When User press the button "Sign in with Google"
	And User see the "Sign in to your Google account" field
	And fills in the e-mail which is not correspond to any Google account
	Then User see the red "Could not find google account" message
	
	# There is no mention about possibility to change Google accounts, but I decide it should be possible and test it. 
	# It turned out to be impossible to change the account, so I still doubt.
Scenario: 3.1_04 User needs to change Google account 
	Given User has several Google accounts
	When User press the button "Sign in with Google"
	And User select one Google account 
	And User log out
	And User press the button "Sign in with Google"
	And User choose another Google account
	Then the page with Quantori Scoring is opened