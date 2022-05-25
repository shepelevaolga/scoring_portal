Feature: 1.1.1.1. sign in with user's Google Account

Background:
    Given user has a Google Account accountfortesting@gmail.com with assigned phone number +79658905735, password is 0987Po!$
    And https://qa.ddso-spot.quantori.com/ is opened in browser

@tc:1
Scenario Outline: 1.1.1.1_01 Logging to the application with valid Email (Google Account has not been logged in)
    Given user didn't sign in Google Account in page https://accounts.google.com using <browser>
    When user clicks on "Sign in with Google " button
    And user fills "accountfortesting@gmail.com" in "Email or phone" text field
    And user clicks "Next" button
    And user fills in "0987Po!$" in "Enter your password" text field
    And user clicks "Next" button
    Then User is signed in to the application
    And "Dataset" page is opened with field "Drop your csv file here or click to browse"
    And "New user" username is displayed and can be changed
    And "log-out" button is active       

    Examples:
        | browser           |
        | Google Chrome     |
        | Firefox           |
        | Internet Explorer |
@tc:2
Scenario Outline: 1.1.1.1_02 Logging to the application with valid Email reduced (Google Account has not been logged in)
    Given user didn't sign in Google Account in page https://accounts.google.com using <browser>
    When user clicks on "Sign in with Google " button
    And user fills "accountfortesting" in "Email or phone" text field
    And user clicks "Next" button
    And user fills in "0987Po!$" in "Enter your password" text field
    And user clicks "Next" button
    Then User is signed in to the application
    And "Dataset" page is opened with field "Drop your csv file here or click to browse"
    And "New user" username is displayed and can be changed
    And "log-out" button is active       

    Examples:
        | browser           |
        | Google Chrome     |
        | Firefox           |
        | Internet Explorer |
@tc:3
Scenario Outline: 1.1.1.1_03 Logging to the application with valid phone number (Google Account has not been logged in)
    Given user didn't sign in Google Account in page https://accounts.google.com using <browser>
    When user clicks on "Sign in with Google " button
    And user fills "+79658905735" in "Email or phone" text field
    And user clicks "Next" button
    And user fills in "0987Po!$" in "Enter your password" text field
    And user clicks "Next" button
    Then User is signed in to the application
    And "Dataset" page is opened with field "Drop your csv file here or click to browse"
    And "New user" username is displayed and can be changed
    And "log-out" button is active       

    Examples:
        | browser           |
        | Google Chrome     |
        | Firefox           |
        | Internet Explorer |
@tc:4
Scenario Outline: 1.1.1.1_04 Logging to the application with Google Account (just one) that has been already logged in 
    Given user signs in Google Account in page https://accounts.google.com using <browser> 
    When user clicks on "Sign in with Google " button
    Then User is signed in to the application
    And "Dataset" page is opened with field "Drop your csv file here or click to browse"
    And "New user" username is displayed and can be changed
    And "log-out" button is active       

    Examples:
        | browser           |
        | Google Chrome     |
        | Firefox           |
        | Internet Explorer |
@tc:5
Scenario Outline: 1.1.1.1_05 Logging to the application with one of two Google Accounts that have been already logged in 
    Given user has second Google Account secondaccountfortesting@gmail.com with assigned phone number +79658905736, password is 0856iFk?
    And Both user's Google account are signed in page https://accounts.google.com using <browser>
    When user clicks on "Sign in with Google " button
    And  user hits on "secondaccountfortesting@gmail.com" in "Choose an account" field
    Then User is signed in to the application
    And "Dataset" page is opened with field "Drop your csv file here or click to browse"
    And "New user" username is displayed and can be changed
    And "log-out" button is active       

    Examples:
        | browser           |
        | Google Chrome     |
        | Firefox           |
        | Internet Explorer |
@tc:6
Scenario Outline: 1.1.1.1_06 Logging to the application with Google Account that has been already logged in and then signed out 
    Given user signs in Google Account in page https://accounts.google.com and then signs out using <browser> 
    When user clicks on "Sign in with Google " button
    And  user hits on "accountfortesting@gmail.com" in "Choose an account" field
    And user fills in "0987Po!$" in "Enter your password" text field
    And user clicks "Next" button
    Then User is signed in to the application
    And "Dataset" page is opened with field "Drop your csv file here or click to browse"
    And "New user" username is displayed and can be changed
    And "log-out" button is active       

    Examples:
        | browser           |
        | Google Chrome     |
        | Firefox           |
        | Internet Explorer |
@tc:7
Scenario Outline: 1.1.1.1_07 Logging to the application by using another Google Account (one has been already logged in and then signed out) 
    Given user signs in Google Account in page https://accounts.google.com and then signs out using <browser> 
    And user has second Google Account secondaccountfortesting@gmail.com with assigned phone number +79658905736, password is 0856iFk?
    And user didn't sign in second Google Account in page https://accounts.google.com
    When user clicks on "Sign in with Google " button
    And  user hits on "use another account" in "Choose an account" field
    And user fills "secondaccountfortesting@gmail.com" in "Email or phone" text field
    And user clicks "Next" button
    And user fills in "0856iFk?" in "Enter your password" text field
    And user clicks "Next" button
    Then User is signed in to the application
    And "Dataset" page is opened with field "Drop your csv file here or click to browse"
    And "New user" username is displayed and can be changed
    And "log-out" button is active       

    Examples:
        | browser           |
        | Google Chrome     |
        | Firefox           |
        | Internet Explorer |
@tc:8
Scenario: 1.1.1.1_08 Logging to the application with not the Google Account
    Given user didn't sign in Google Account in page https://accounts.google.com
    And user has a mail account accountfortesting@mail.ru with assigned phone number +79658905895, password is Khjg4865
    When user clicks on "Sign in with Google " button
    And user fills "accountfortesting@mail.ru" in "Email or phone" text field
    And user clicks "Next" button
    And user fills in "Khjg4865" in "Enter your password" text field
    And user clicks "Next" button
    Then Error message "!Wrong password. Try again or click Forgot password to reset it" is displayed and text field "Enter your password" has a red frame
@tc:9
Scenario: 1.1.1.1_09 Logging to the application with not the Google Account (reduced one)
    Given user didn't sign in Google Account in page https://accounts.google.com
    And user has a mail account accountfortesting@mail.ru with assigned phone number +79658905895, password is Khjg4865
    When user clicks on "Sign in with Google " button
    And user fills "accountfortesting" in "Email or phone" text field
	Then Error message "Couldn't find your Google Account" is displayed and text field "Email or phone" has a red frame
@tc:10
Scenario: 1.1.1.1_10 Logging to the application with incorrect format of phone number (without +)
    Given user didn't sign in Google Account in page https://accounts.google.com
    When user clicks on "Sign in with Google " button
    And user fills "79658905735" in "Email or phone" text field
    And user clicks "Next" button
    Then Error message "!Couldn’t find your Google Account. Try using your email address instead" is displayed and text field "Email or phone" has a red frame
@tc:11
Scenario: 1.1.1.1_11 Logging to the application with incorrect format of phone number (without +7)
    Given user didn't sign in Google Account in page https://accounts.google.com
    When user clicks on "Sign in with Google " button
    And user fills "9658905735" in "Email or phone" text field
    And user clicks "Next" button
    Then Error message "!Couldn’t find your Google Account. Try using your email address instead" is displayed and text field "Email or phone" has a red frame
@tc:12
Scenario: 1.1.1.1_12 Logging to the application with empty "Email or phone" field
    Given user didn't sign in Google Account in page https://accounts.google.com
    When user clicks on "Sign in with Google " button
    And user leaves empty "Email or phone" text field
    And user clicks "Next" button
    Then Error message "!Enter an email or phone number" is displayed and text field "Email or phone" has a red frame
@tc:13
Scenario: 1.1.1.1_13 Logging to the application with wrong PW
    Given user didn't sign in Google Account in page https://accounts.google.com
    When user clicks on "Sign in with Google " button
    And user fills "accountfortesting@gmail.com" in "Email or phone" text field
    And user clicks "Next" button
    And user fills in "Po0987$!" in "Enter your password" text field
    And user clicks "Next" button
    Then Error message "!Wrong password. Try again or click 'Forgot password' to reset it" is displayed and text field "Enter your password" has a red frame
@tc:14
Scenario: 1.1.1.1_14 Logging to the application with empty PW
    Given user didn't sign in Google Account in page https://accounts.google.com
    When user clicks on "Sign in with Google " button
    And user fills "accountfortesting@gmail.com" in "Email or phone" text field
    And user clicks "Next" button
    And user leaves empty "Enter your password" text field
    And user clicks "Next" button
    Then Error message "!Enter a password" is displayed and text field "Enter your password" has a red frame
