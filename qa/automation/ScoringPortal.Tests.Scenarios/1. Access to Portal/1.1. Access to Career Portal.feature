Feature: 1.1. Sign in with user's Google Account
Background: Given user connected to the Internet
Scenario Outline: 1.1_01 User can open Scoring portal login page
	Given User run <browser>
	And User have not logged in the portal yet
	When User enters Web-link: https://qa.ddso-spot.quantori.com/
	And User Clicks 'Enter'
	Then User see Quantori Scoring portal login page
	Examples:
		| browser   |
		|	Edge    |
		|	Chrome  |
		|	Opera   |
		|	Firefox |


Scenario: 1.2_01 User can proceed to Google Authentication page
   Given  User opened Scoring portal login page
   When  User clicks button 'Sign in with Google'
   Then   Authentication page opens 

   Scenario: 1.2_02 User has one saved Google account and tries to sign in
   Given   User is on the Google Authentication page
   When User puts the cursor into textfield
   And User enters e-mail existed Google account
   Then Webpage with textfield for password is opened

   Scenario: 1.2_03 User has several saved Google account and tries to sign in
   Given User is on the Google Authentication page
   When User puts the cursor into textfield
   Then User see the list of user's existing Google accounts 

   Scenario: 1.2_04 Already logged in user can sign in to Quantori Scoring portal page without authentication
	Given User logged into Quantori Scoring portal using existing Google account
	When User run <browser>
	And User enters URL https://qa.ddso-spot.quantori.com
	Then User see Quantori Scoring portal page
	And 'New User' name can be changed
   And 'Log Out' button is active
   And 'Drop your CSV..' button is active


  Scenario: 1.2_05 User can Sign in with valid e-mail, valid password account		
   Given  User is on the Google Authentication page
   When User enters valid e-mail address into textfield
   And User clicks 'Next' button
   And Webpage with textfield for password is opened
   And User enters valid password into textfield
   And User clicks 'Next' button 
   And User passes 2 phases authorisation
   Then User see Quantori Scoring portal page
   And 'New User' name can be changed
   And 'Log Out' button is active
   And 'Drop your CSV..' button is active

      Scenario: 1.2_06 User can Sign in with valid phone number, valid password account
   Given  User is on the Google Authentication page
   When User enters valid phone number address into textfield
   And User clicks 'Next' button
   And Webpage with textfield for password is opened
   And User enters valid password into textfield
   And User clicks 'Next' button 
   And User passes 2 phases authorisation
   Then User see Quantori Scoring portal page
   And 'New User' name can be changed
   And 'Log Out' button is active
   And 'Drop your CSV..' button is active

   Scenario: 1.2_07 User can't Sign in with invalid e-mail
   Given  User is on the Google Authentication page
   And User enters invalid e-mail address into textfield
   And User Clicks 'Next' button
   Then 'e-mail textfield' is marked red
   And User see the message 'Couldn't find your Google Account'

   Scenario: 1.2_08 User can't Sign in with invalid phone number
   Given  User is on the Google Authentication page
   And User enters invalid phone number into textfield
   And User clicks 'Next' button 
   Then 'phone number textfield' is marked red
   And The message is apeeared 'Couldn't find your Google Account. Try using your e-mail instead'

   Scenario: 1.2_09 User can't Sign in with invalid password
   Given  User is on the Google Authentication page
   And User enters valid e-mail address(or phone number) into textfield
   And User clicks 'Next' button
   And User enters invalid password into textfield
   And User clicks 'Next' button
   Then password textfield' is marked red
   And The message is apeeared 'Wrong password. Try again or click Forgot password to reset it'


   Scenario: 1.2_10 User wants Sign in, but forgot password
   Given  User is on the Google Authentication page
   And User enters valid e-mail address into textfield
   And User clicks 'Next' button 
   And User clicks 'Forgot password' button 
   Then The message is apeeared 'Couldn't sign you in. Contact your domein admin for help'

Scenario: 1.3.Signed User can change User Name into Quantori Scoring portal page
Given User have already sign in
And User is on the Quantori Scoring portal page
When User puts cursor to <username> field
And User deletes username 
And User writes new User name
And User sign out
And User signs in with the same account
Then User sees saved new name


Scenario: 1.4 User can't open Scoring portal login page without VPN
Given User run <browser>
When User Turn off provided VPN
And User enters Web-link: https://qa.ddso-spot.quantori.com/
And User Clicks 'Enter'
Then The message is apeeared 'Can't reach this page'


