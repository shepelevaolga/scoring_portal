Feature: 1.1 Sign in with user's Google Account

Background: 
	Given user is on sign in 'https://qa.ddso-spot.quantori.com/' page
	And user clicks on the 'sign in page with Google' button
	And user has multiple google account saved 
		
Scenario Outline: 1.1_01 Sign in with invalid password
	Given user has 'Choose an option' dialog box displayed on the screen
	And user clicks on 'Use another account' button
	When user fills in a valid email into 'email or phone' text field with 'beatricek00@gmail.com'
	And user clicks the 'Next' button
	And user fills in invalid 'Password' text field with value 'incorrect.password'
	And user clicks the 'Next' button
	Then a text 'Can't login! Wrong email or password.' 

Scenario Outline: 1.1_02 Sign in with an unregistered google account
	Given user has 'Choose an option' dialog box displayed on the screen
	And user clicks on 'Use another account'button
	When user fills an invalid email account 'email or phone' text field with 'incorrect@yahoo.com'
	And user clicks the 'Next' button
	Then the 'Email or phone textfield'is marked red. 
	And a text 'Couldn't find your Google account' is displayed 

Scenario Outline: 1.1_03 Sign in with empty 'email' text field
	Given user has 'Choose an option' dialog box displayed on the screen
	And user clicks on 'Use another account' button
	When user leaves the account 'email or phone' textbox empty
	And user clicks the 'Next' button
	Then the 'Email or phone' textfield is marked red. 
	And 'Enter email or phone number' appears in the validation errors region

Scenario Outline: 1.1_04 Sign in with empty 'password' text field
	Given  user has 'Choose an option' dialog box displayed on the screen
	And user clicks on 'Use another account' button
	And user has a valid email credentials
	When user fills the 'Email or phone' text field with 'beatricek006@gmail.com'
	But user leaves the 'Password' text field empty
	And user clicks the 'Next' button
	Then the 'Password' text field is marked red. 
	And 'Enter a password' appears in the validation errors region

Scenario Outline: 1.1_05 Sign in with invalid phone number
	Given  user has 'Choose an option' dialog box displayed on the screen
	And user clicks on 'Use another account' button
	When user fills the account 'Email or phone' text field with invalid phone number format 
	And user clicks the 'Next' button
	Then the 'email textfield'is marked red. 
	And 'Enter email or phone number' appears in the validation errors region
		
		Examples: 
			| Invalid phone number format | type                             |
			| +79836120001                | Not registered on google account |
			| +798361200                  | Incomplete phone number          |

	
Scenario Outline: 1.1_06 Sign in with valid email account 
	Given  user has 'Choose an option' dialog box displayed on the screen
	And user clicks on 'Use another account' button
	When user fills the account email textbox with value 'beatricek006@gmail.com' 
	And user clicks 'Next' button
	And user fills the 'Password' text field with 'Monkeytail2@' 
    And user clicks 'Next' button
	Then user enters the scoring homepage

Scenario Outline: 1.1_07 Sign in with valid phone number 
	Given  user has 'Choose an option' dialog box displayed on the screen
	And user clicks on 'Use another account' button
	When user fills the account 'Email or phone number' textbox with value '+78972028989' 
	And user clicks 'Next' button
	And user fills the 'Password' text field with 'Monkeytail2@' 
	And user clicks 'Next'button
    Then user enters the scoring homepage

Scenario Outline: 1.1_08 Sign in with valid saved Google account in 'Examples'
	Given user has 'Choose an option' dialog box displayed on the screen
	When multiple emails are displayed on the signin page to 'Choose an account to continue to quantori.com
	Then  user enters the scoring homepage through the states in the table
	| Listed email                            | Action | State                                          |
	| beatricek006@gmail.com                  | Clicks | Enter homepage                                 |
	| oshanimioluwakemi@gmail.com             | Clicks | Enter homepage                                 |
	| oluwakemisola.oshanimi@quantori.academy | Clicks | Enter homepage                                 |
	| Use another account                     | Clicks | Redirects to sign in with valid google account |
   And User clicks on 'Use another account'
   And following features are displayed on the screen
   
	| Feature                  | Action							| Button | 
	| Enter                    | Valid input					| Click  |
	| Email or phone textfield | beatriceoluwakemisola@gmail.com| Next   |
	| Enter your password      | VirusDetectedK006				| Next   | 
   And user is at the homepage
    
		Examples: 
		| Name of browsers |
		| Chrome           |
		| Edge             |

Scenario Outline: 1.1_09 Sign in with 'forgets email address' option
	Given user has 'Choose an option' dialog box displayed on the screen
	When user clicks on 'Use another account'button
	And user clicks on 'Forget email?' button
	And  user has 'Find your email' dialog box displayed  
	Then 'the following Features are displayed on the screen' simultaneaously
		| Features                            | Action																| Button |
		| Enter	                              | Valid input															| Click  |
		| 'Email or phone' text field         | beatriceoluwakemisola@gmail.com										| Next   |
		| What's your name? dialog box        | Enter First name 'Beatrice' and Last name 'O' name in the textfield | Next   |
		| Get a verification code dialog box  |																		| Send   |
		| Enter the code  dialog box          | Enter verification code '631025'									| Next   |
   And 'choose an account' dialog box pops up
   And user selects the 'google account' button
   And enters the scoring homepage
 
Scenario: 1.1_10 Sign in with a valid password in the 'email or phone number' text field
	Given user has 'Choose an option' dialog box displayed on the screen
	And user has a valid google account
	And user clicks on 'Use another account' button
	When user fills the account 'Email or phone' text field with value 'VirusDetectedK006'
	And user clicks the 'Next' button
	Then the 'Email textfield'is marked red. 
	And a text 'Couldn't find your Google account' appears in the validation errors region


Scenario Outline: 1.1_11 Sign in with valid email and unplugs internet connection 
	Given user has 'Choose an option' dialog box displayed on the screen
	And user clicks on 'Use another account' button
	When user fills the account 'Email or phone'  textbox with value 'correct@gmail.com'
	And user turnoff internet connection 
	And user clicks on 'Next' button
    Then display a dialogue box 'Something went wrong' 
	And 'Sorry, something went wrong there. 
	And Try again.' dialog box appears

Scenario Outline: 1.1_12 Sign in with valid email and the laptop sleeps due to inactivity 
	but user fails to click 'Next' button
	Given  user has 'Choose an option' dialog box displayed on the screen
	And user clicks on 'Use another account' button
	When user fills the account 'Email or phone' text field with value 'incorrect@gmail.com'
	And user fails to click the 'Next' button 
    And user screen goes off due to inactivity
	And user hits the mouse
	Then user's screen resumed
	And display a dialogue box 'You're not signed in' 
	And User has 'Your session ended because there was no activity' displayed on the screen
	And 'Try again' button in the dialog box
	
