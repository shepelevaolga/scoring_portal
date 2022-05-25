Feature: 1.1 Sign in with user's Google Account

Background: 
	Given user is on sign in 'https://qa.ddso-spot.quantori.com/'
	And user clicks on the signin page
		
Scenario Outline: 1.1_01 Sign in with invalid password
	Given 'Choose an option' dialog box is displayed
	And user clicks on 'Use another account'
	When user fills the account 'email text field with value 'beatricek00@gmail.com'
	And user clicks the 'Next' button
	And user fills an incorrect password text field with value 'incorrect.password'
	And user clicks the 'Next' button
	Then a text 'Can't login! Wrong email or password.' appears in the validation errors region

Scenario Outline: 1.1_02 Sign in with no registered google account
	Given 'Choose an option' dialog box is displayed
	And user clicks on 'Use another account'
	When user fills the account 'email or phone' text field with value 'incorrect@yahoo.com'
	And user clicks the 'Next' button
	Then the 'email textfield'is marked red. 
	And a text 'Couldn't find your Google account' appears in the validation errors region

Scenario Outline: 1.1_03 Sign in with empty 'email' text field
	Given 'Choose an option' dialog box is displayed
	And user clicks on 'Use another account'
	When user leaves the account 'email or phone' textbox empty
	And user clicks the 'Next' button
	Then the 'email textfield'is marked red. 
	And 'Enter email or phone number' appears in the validation errors region

Scenario Outline: 1.1_04 Sign in with empty 'password' text field
	Given 'Choose an option' dialog box is displayed
	And user clicks on 'Use another account'
	When user fills the account 'email or phone' text field with a valid value 'beatricek006@gmail.com'
	But user leaves the password text field empty
	And user clicks the 'Next' button
	Then the 'password' text field is marked red. 
	And 'Enter a password' appears in the validation errors region

Scenario: 1.1_05 Sign in with invalid phone number
	Given 'Choose an option' dialog box is displayed
	And user clicks on 'Use another account'
	When user fills the account 'email or phone' text field 
	And user clicks the 'Next' button
	Then the 'email textfield'is marked red. 
	And 'Enter email or phone number' appears in the validation errors region
		
		Examples: 
			| Invalid phone number format | type                             |
			| +79836120001                | Not registered on google account |
			| +798361200                  | Incomplete phone number          |

	
Scenario Outline: 1.1_06 Sign in with valid email account 
	Given 'Choose an option' dialog box is displayed
	And user clicks on 'Use another account'
	When user fills the account email textbox with value 'beatricek006@gmail.com' 
	And user clicks 'Next' button
	And user fills the password textfield with 'Monkeytail2@' 
    	And user clicks 'Next' button
	Then user enters the scoring homepage

Scenario Outline: 1.1_07 Sign in with valid phone number 
	Given 'Choose an option' dialog box is displayed
	And user clicks on 'Use another account'
	When user fills the account 'email or phone number' textbox with value '+78972028989' 
	And user clicks 'Next' button
	And user fills the password text field with 'Monkeytail2@' 
	And user clicks 'Next'button
    	Then user enters the scoring homepage

Scenario Outline: 1.1_08 Sign in with valid saved Google account on different browsers
	Given 'Choose an option' dialog box is displayed
	And user clicks on 'Use another account'
	When user clicks the 'Next' button
	Then number of emails are displayed on the signin page to 'Choose an account to continue to quantori.com
	| Feature                                 | Action | State                                          |
	| beatricek006@gmail.com                  | Clicks | Enter homepage                                 |
	| oshanimioluwakemi@gmail.com             | Clicks | Enter homepage                                 |
	| oluwakemisola.oshanimi@quantori.academy | Clicks | Enter homepage                                 |
	| Use another account                     | Clicks | Redirects to sign in with valid google account |
   And User clicks on 'Use another account'
   And following features are displayed on the screen
   | Feature                  | Action							| Button | 
   | Enter                    | Valid input						| Click  |
   | Email or phone textfield | beatriceoluwakemisola@gmail.com	| Next   |
   | Enter your password      | VirusDetectedK006				| Next   | 
   And user is at the homepage
    
		Examples: 
		| Name of browsers |
		| Chrome           |
		| Edge             |

Scenario Outline: 1.1_09 User forgets 'email address'
	Given user is at the sign in page
	When user clicks on 'Use another account'
	And user clicks on 'forget email?'
	Then 'find your email' dialog box open  
   And the following features are displayed on the screen
		| Feature                            | Action	 							    | Button |
		| Enter                              | Valid input							    | Click  |
		| Email or phone textfield           | beatriceoluwakemisola@gmail.com					    | Next   |
		| What's your name? dialog box       | Enter First name 'Beatrice' and Last name 'O' name in the textfield  | Next   |
		| Get a verification code dialog box |									    | Send   |
		| Enter the code  dialog box         | Enter verification code '631025'					    | Next   |
   And 'choose an account' dialog box pops up
   And user selects the 'google account' and enters the scoring homepage
 
Scenario: 1.1_10 Sign in with a valid password in the 'email or phone number' text field
	Given 'Choose an option' dialog box is displayed
	And user clicks on 'Use another account'
	When user fills the account 'email or phone' text field with value 'VirusDetectedK006'
	And user clicks the 'Next' button
	Then the 'email textfield'is marked red. 
	And a text 'Couldn't find your Google account' appears in the validation errors region


Scenario Outline: 1.1_11 Sign in with valid email and unplugs internet connection 
	Given 'Choose an option' dialog box is displayed
	And user clicks on 'Use another account'
	When user fills the account email textbox with value 'incorrect@gmail.com'
	And user turnoff internet connection 
	And user clicks on 'Next' button
    	Then display a dialogue box 'Something went wrong' 
	And 'Sorry, something went wrong there. 
	And Try again.' dialog box appears

Scenario Outline: 1.1_12 Sign in with valid email and the laptop sleeps due to inactivity 
	but user fails to click 'Next' button
	Given user is at the sign in page
	When user fills the account email text field with value 'incorrect@gmail.com'
	And user fails to click the 'Next' button 
    	And user screen goes off due to inactivity 
	Then display a dialogue box 'You're not signed in' 
	And 'Your session ended because there was no activity. 
	And 'Try again' button in the dialog box
	
