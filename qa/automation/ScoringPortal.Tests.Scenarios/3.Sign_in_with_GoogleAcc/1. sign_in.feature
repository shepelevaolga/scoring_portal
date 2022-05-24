Feature: 1.1 Sign in with Google Account

Background:
	Given user turn on VPN with necessary config
	And go to https://qa.ddso-spot.quantori.com/

Scenario: 1.1_01 User has google account
	Given User has save google account
	When User press the button "Sign in with Google"
	And User select necessary Google account 
	Then the page with Quantori Scoring is opened

Scenario: 1.1_02 User doesn't have save google account
	Given User has a google account but it didn't save in this browser
	When User press the button "Sign in with Google"
	And User see the "Sign in to your Google account" field
	And User fills in all necessary information
	Then the page with Quantori Scoring is opened

Scenario: 1.1_03 User doesn't have any Google account
	Given User doesn't have any Google account
	When User press the button "Sign in with Google"
	And User see the "Sign in to your Google account" field
	And fills in e-mail with @mail.ru adress
	Then User see the red "Could not find google account" message
	
	# There is no mention about possibility to change Google accounts, but I decide it should be possible and test it. 
	# It turned out to be impossible to change the account, so I still doubt.


Scenario: 1.1_04 User needs to change Google account 
	Given User has several Google accounts
	When User press the button "Sign in with Google"
	And User select one Google account 
	And User log out
	And User press the button "Sign in with Google"
	And User choose another Google account
	Then the page with Quantori Scoring is opened