Feature: 1.1. Access to Career Portal

Background:
	Given user connected to the Internet using provided VPN profile

Scenario: 1.1_01 User can open Quantori Scoring portal login page
	Given User run <browser>
	And used have not logged in the portal yet
	When user enters URL https://qa.ddso-spot.quantori.com
	Then user should see Quantori Scoring portal login page with following items
		| Quantori Scoring logo      |
		| Sign in with Google button |

	Examples:
		| browser |
		| Chrome  |
		| Edge    |
		| Firefox |

Scenario: 1.2_01 User can proceed to Google Authentication page
	Given User opened Quantori Scoring portal login page
	When user clicks on Sign in with Google
	Then user should see Google authentication page

Scenario: 1.2_02 User can login into Quantori Scoring portal using allowed Google account
	Given User proceeded into Google Authentication page
	When user enters valid email address from Qunatory domain
	And user Presses Next
	And user enters valid password
	And user passes 2 phases authorisation
	Then user should see Quantori Scoring portal with following items
		| Quantori Scoring logo                                    |
		| Dataset                                                  |
		| "Drop your CSV file here or click to browse" placeholder |
		| "Max: 100MB \| 50,000 Rows \| 200 Columns" text          |
		| "New User" editable text                                 |
		| Logout button                                            |

Scenario: 1.2_03 Already logged in user can enter into Quantori Scoring portal without additional authentication
	Given User logged into Quantori Scoring portal using existing Google account
	When user enters URL https://qa.ddso-spot.quantori.com
	Then user should see Quantori Scoring portal

Scenario: 1.2_04 User can logout from Quantori Scoring portal
	Given User logged into Quantori Scoring portal
	When user clicks on Logout button
	Then user sees Quantori Scoring login page
	And user should see Sign in with Google button

Scenario: 1.2_05 User can change Google account to use Quantori Scoring portal
	Given User logged out from  Quantori Scoring portal
	When user clicks on Logout button
	When user clicks on Sign in with Google
	Then user should see Google authentication page

Scenario: 1.2_06 User cannot login into Quantori Scoring portal using not allowed Google account
	Given User proceeded into Google Authentication page
	When user enters valid email address outside of Qunatory domain
	And user Presses Next
	And user enters valid password
	And user passes 2 phases authorisation
	Then user should not have access to Quantori Scoring portal

Scenario: 1.3_01 User can not use Quantori Scoring without VPN
	When user disconnected from provided VPN
	And user enters URL https://qa.ddso-spot.quantori.com
	Then Quantori Scoring portal should not not load