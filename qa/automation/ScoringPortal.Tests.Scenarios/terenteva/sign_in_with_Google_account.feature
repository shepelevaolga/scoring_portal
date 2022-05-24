Feature: 1. Sign in to Quantori Scoring Portal with Google account feature

 Background:
 	Given Quantori Scoring Portal page (QSPP) exists
 	And QSPP is linked to the Internet address https://qa.ddso-spot.quantori.com/
 	And Two versions of QSPP could be displayed by the same address: QSPP 'User NOT signed in' and QSPP 'User signed in'
 	And On the QSPP 'User NOT signed in' version following components are displayed:
 		| Component										|
 		| 'Sign in with Google' button					|
 		| Quantori Scoring	logotype image				|
 	And On the QSPP 'User signed in' version following components are displayed:
 		| Component                                     |
 		| Quantori Scoring	logotype image              |
		| Divider                                       |
 		| 'Dataset' text line                           |
 		| Divider                                       |
 		| Drag & drop form								|
 		| Username text field							|
 		| User profile icon								|
 		| Sign out button with sign out icon			|

 Scenario: 1_01. 'Sign in with Google' button on the QSPP 'User NOT signed in' version is interactive and hyperlinked
	Given QSPP 'User NOT signed in' version is opened in a browser tab
	When User drags cursor to the 'Sign in with Google' button
	Then 'Sign in with Google' button is highlighted
	And Cursor appearance is changed from standard to Link pointer
	And Hyperlink address is shown at the bottom left corner of the page

 Scenario Outline: 1_02. User is redirected to Google Login page
 	Given QSPP 'User NOT signed in' version is opened in a browser tab
	And User Google account state is <User account state>
	When User clicks on 'Sign in with Google' button
	Then User is redirected to Google Accounts Login page
	And Google Accounts Login page is opened in the same browser tab

	  Examples: 
	  | User account state                                     |
	  | User has no Google account                             |
	  | User has a Google account, is not signed in the account |
	  | User has a Google account, is signed in it, not signed in QSPP before from the device and browser used |

 Scenario: 1_03. User goes straight from QSPP 'User not signed in' to QSPP 'User signed in'
	Given QSPP 'User NOT signed in' version is opened in a browser tab
	And User has a Google account
	And User is signed in this Google account
	And User has signed in to QSPP before from the device and browser used
	When User clicks on 'Sign in with Google' button
	Then User is redirected to QSPP 'User signed in' version
	And QSPP 'User signed in' version is opened in the same browser tab

 Scenario Outline: 1_04. User is signed in QSPP after managing Google account
	Given QSPP 'User NOT signed in' version is opened in a browser tab
	And User account state is <User account state>
	And User has clicked on 'Sign in with Google' button on QSPP 'User not signed in'
	And User was redirected to Google Accounts Login page
	And Google Accounts Login page is opened in the browser tab
	When User completes <Actions> according to <User account state>
	Then User is redirected to QSPP 'User signed in' version
	And QSPP 'User signed in' version is opened in the same browser tab

	  Examples: 
	  | User account state                                                     | Actions								 |
	  | User has no Google account                                             | User registers an account and signs in  |
	  | User has a Google account, is not signed in the account                | User signs in the account				 |
	  | User has a Google account, is signed in it, not signed in QSPP before* | User chooses the account to proceed	 |
	  # *from the device and browser used

 Scenario: 1_05. User signs out from the QSPP
	Given QSPP 'User signed in' version is opened in a browser tab
	When User clicks Sign out button marked with sign out icon
	Then User is redirected to QSPP 'User NOT signed in' version
	And QSPP 'User NOT signed in' version is opened in the same browser tab

 Scenario: 1_06. User stays signed in after QSPP 'User signed in' version is refreshed
	Given QSPP 'User signed in' version is opened in a browser tab
	When User refreshes the page
	Then User stays signed in the QSPP
	And QSPP 'User signed in' version is opened in a browser tab

 Scenario: 1_07. User QSPP sign in state when user is signed out from Google account in the browser
	Given QSPP 'User signed in' version is opened in a browser tab
	And User's Google account page in opened in another tab in the same browser
	And User's Google account page is currently on a display
	When User signs out from the Google account
	And User goes to the tab where QSPP 'User signed in' version is opened
	And User refreshes the page
	Then QSPP 'User NOT signed in' version is opened in the same browser tab
	# It seemes like it should be that way, as user is logged out from Google, but in reality QSPP 'User signed in' is opened



