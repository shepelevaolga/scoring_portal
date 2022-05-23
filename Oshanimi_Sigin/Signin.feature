Feature: sign in with user's Google Account
As a user I want to sign in 'https://qa.ddso-spot.quantori.com/' 
so I could use application functionality

Background: Given user has a registered google account 
				And user clicks on the signin page
		
@NegativeScenarios 

Scenario Outline: 1.1_01 Signing in with invalid credentials
 Given user is at the sign in page, 
 And 'Choose an option' dialog box is displayed
 And user clicks on 'Use another account'
  When user fills the account email textbox with value 'beatricek00@gmail.com'
  And user clicks the 'Next' button
   And user fills the password textbox with value 'incorrect.password'
   And user clicks the 'Next' button
  Then a text 'Can't login! Wrong email or password.' should appear in the validation errors region

Scenario Outline: 1.1_02 Signing in with invalid email credentials
Given user is at the sign in page 
And 'Choose an option' dialog box is displayed
And user clicks on 'Use another account'
 When user fills the account email textbox with value 'incorrect@yahoo.com'
 And user clicks the 'Next' button
  Then the 'email textfield'is marked red. 
	And a text 'Couldn't find your Google account' should appear in the validation errors region

Scenario Outline: 1.1_03 Signing in with empty 'email' textbox
 Given user is at the sign in page
 And 'Choose an option' dialog box is displayed
And user clicks on 'Use another account'
  When user leaves the account email textbox empty
   And user clicks the 'Next' button
 Then the 'email textfield'is marked red. 
 And 'Enter email or phone number' should appear in the validation errors region

 Scenario Outline: 1.1_04 Signing in with empty 'password' textbox
 Given user is at the sign in page
 And 'Choose an option' dialog box is displayed
And user clicks on 'Use another account'
  When user fills the account email textbox with value 'beatricek006@gmail.com'
   But user leaves the password textbox empty
   And user clicks the 'Next' button
 Then the 'password textfield'is marked red. 
	And 'Enter a password' should appear in the validation errors region

@Recoverychecks
Scenario Outline: 1.1_05 User sign in with valid email and the laptop sleeps due to inactivity 
but user fails to click 'Next' button
 Given user is at the sign in page
  When user fills the account email textbox with value 'incorrect@gmail.com'
   And user fails to click the 'Next' button 
    And user screen goes off due to inactivity 
  Then display a dialogue box 'You're not signed in' 
  And 'Your session ended because there was no activity. Try signing in again' should appear
 And 'Try again' button in the dialogue box

 Scenario Outline: 1.1_06 User sign in with valid email and unplugs internet connection 
 Given user is at the sign in page
 And 'Choose an option' dialog box is displayed
And user clicks on 'Use another account'
  When user fills the account email textbox with value 'incorrect@gmail.com'
   And user turnoff internet connection 
   And user clicks on 'Next' button
    Then display a dialogue box 'Something went wrong' 
  And 'Sorry, something went wrong there. Try again.' should appear

@PortabilityChecks
@PositiveScenarios

Scenario Outline: 1.1_07 User can sign in with valid sign in credentials on edge and chrome browser 
 Given user is at the sign in page on Chrome browser
 And user is at the sign in page on edge browser
  When user clicks the 'Next' button
  Then number of emails are displayed on the signin page to 'Choose an account to continue to quantori.com'
   | Feature                                 | Action | State                                          |
   | beatricek006@gmail.com                  | Clicks | Enter homepage                                 |
   | oshanimioluwakemi@gmail.com             | Clicks | Enter homepage                                 |
   | oluwakemisola.oshanimi@quantori.academy | Clicks | Enter homepage                                 |
   | Use another account                     | Clicks | Redirects to sign in with valid google account |
   And User clicks on 'Use another account'
   And following features are displayed on the screen
   | Feature                  | Action							| Button | 
   | Enter                    | Valid input						| Click  |
   | Email or phone textfield | beatriceoluwakemisola@gmail.com | Next   | 
   | Enter your password      | VirusDetectedK006				| Next   | 
   And user is at the homepage

Scenario Outline: 1.1_08 User forgets 'email address'
 Given user is at the sign in page
 When user clicks on 'Use another account'
 And user clicks on 'forget email?'
  Then 'find your email' dialog box open  
   And the following features are displayed on the screen
   | Feature                            | Action                                                         | Button |
   | Enter                              | Valid input                                                    | Click  |
   | Email or phone textfield           | beatriceoluwakemisola@gmail.com                                | Next   |
   | What's your name? dialog box       | Enter First name 'Beatrice' and Last 'O' name in the textfield | Next   |
   | Get a verification code dialog box |                                                                | Send   |
   | Enter the code  dialog box         | Enter verification code '631025'                               | Next   |
   And 'choose an account' dialog box pops up
   And user selects the 'google account' and enters the homepage
 
 @CheckNavigationEase
 @intuitivedesign
 @usabilitychecks

Scenario Outline: 1.1_09 User clicks on the 'signin with Google' on the sign in page
 Given user clicks on  the 'sign in with Google'button
 When user enters the next state 
  Then the following list of features are displayed on the screen
  | feature          | type |
  | Tooltips         |      |
  | Dialog box		 |      |
  | Dropdown button  |      |
  | Tabs             |      |
  And user interacts with the 'feature' by navigating the cursor on each feature.


