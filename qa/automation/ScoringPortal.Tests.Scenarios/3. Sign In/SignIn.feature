Feature: 3.1.1.1. Sigh in with google account. 

Background:
    Given the web page "https://qa.ddso-spot.quantori.com/" is open in the browser
    And user's valid credentials: email {email@google.com}, password {Password!23}, assigned phone number {+11234561234}

Scenario Outline: 3.1.1.1_01. Sign in with full email address if the user is not logged in
    Given user clicked on "Sign in with Google" button
    And webpage with a textfield is opened
    When User enters full email address into textfield 
    And User clicks 'Next' button
    And webpage with textfield for password is opened
    And user enters the valid password 
    And user clicks 'Next' button
    Then user is signed in
    And application webpage is opened
    And "New User" name can be changed
    And "Log Out" button is active
    And "Drop your CSV.." button is active
        

    Examples:
        | browsers       |
        | Chrome         |
        | FireFox        |
        | Microsoft Edge |

@tc:1

Scenario Outline: 3.1.1.1_02 Sign in with shortened email address if the user is not logged in
    Given user clicked on "Sign in with Google" button
    And webpage with a textfield is opened
    When User enters shortened email [email] address into textfield 
    And User clicks 'Next' button
    And webpage with textfield for password is opened
    And user enters the valid password 
    And user clicks 'Next' button
    Then user is signed in
    And application webpage is oped
    And "New User" name can be changed
    And "Log Out" button is active
    And "Drop your CSV.." button is active

    Examples:
        | browsers       |
        | Chrome         |
        | FireFox        |
        | Microsoft Edge |

@tc:2
 
Scenario Outline: 3.1.1.1_03 Sign in with phone number if the user is not logged in
    Given user clicked on "Sign in with Google" button
    And webpage with a textfield is opened
    When User enters valid phone number address into textfield 
    And User clicks 'Next' button
    And webpage with textfield for password is opened
    And user enters the valid password 
    And user clicks 'Next' button
    Then user is signed in
    And application webpage is oped
    And "New User" name can be changed
    And "Log Out" button is active
    And "Drop your CSV.." button is active

    Examples:
        | browsers       |
        | Chrome         |
        | FireFox        |
        | Microsoft Edge |

@tc:3


Scenario Outline: 3.1.1.1_04 Sign in with phone number of wrong format if the user is not logged in
    Given user clicked on "Sign in with Google" button
    And webpage with a textfield is opened
    When User enters invalid phone number into textfield 
    And User clicks 'Next' button
    Then the error message appears that account has not been found

    Examples:
        | phone numner format                  |
        | 8 digits                             |
        | 9 digits and a letter                |
        | 8 digits, 1 letter, 1 special symbol |
@tc:4


Scenario Outline: 3.1.1.1_05 Sign in  if the user is logged in the only google account
    Given user is logged in the only google account in the browser
    When User clicks on  "Sign in with Google" button
    Then user is signed in
    And application webpage is oped
    And "New User" name can be changed
    And "Log Out" button is active
    And "Drop your CSV.." button is active
    Examples:
        | browsers       |
        | Chrome         |
        | FireFox        |
        | Microsoft Edge |
@tc:5

Scenario Outline: 3.1.1.1_06 Sign in with full email address if the user is logged in into 2 google accounts
    Given user is logged into 2 google accounts in the browser
    And webpage with a "Sign in with Google"
    When user clicks on "Sign in with Google" button 
    And User chooses the needed google account {email@google.com} from dropdown
    Then user is signed in
    And application webpage is oped
    And "New User" name can be changed
    And "Log Out" button is active
    And "Drop your CSV.." button is active

    Examples:
        | browsers       |
        | Chrome         |
        | FireFox        |
        | Microsoft Edge |
@tc:6

Scenario Outline: 3.1.1.1_07 Sign in if the user is logged in into google account and into the application in another browser
    Given user is logged into google account in the browser A
    And webpage with a "Sign in with Google"
    And user is signed in the application with the same google account in the browser B
    When user clicks on "Sign in with Google" button 
    Then user is signed in
    And application webpage is oped
    And "New User" name can be changed
    And "Log Out" button is active
    And "Drop your CSV.." button is active

    Examples:
        | browsers       |
        | Chrome         |
        | FireFox        |
        | Microsoft Edge |
@tc:7

Scenario Outline: 3.1.1.1_08 Sign in with google account if user is logged off with valid password
    Given user has saved google account in the browser
    And user clicked on "Sign in with Google" button
    And webpage with a textfield for password is opened
    When User enters valid password into textfield 
    And User clicks 'Next' button
    Then user is signed in
    And application webpage is oped
    And "New User" name can be changed
    And "Log Out" button is active
    And "Drop your CSV.." button is active

    Examples:
        | browsers       |
        | Chrome         |
        | FireFox        |
        | Microsoft Edge |
@tc:8

Scenario Outline: 3.1.1.1_09 Sign in with google account if user is signed out with invalid password
    Given user has saved google account in the browser
    And user clicked on "Sign in with Google" button
    And webpage with a textfield for password is opened
    When User enters ivvalid password into textfield 
    And User clicks 'Next' button
    Then the error message appears that the password is wrong

    Examples:
        | browsers       |
        | Chrome         |
        | FireFox        |
        | Microsoft Edge |
@tc:9

Scenario Outline: 3.1.1.1_10 Sign in with google account if user is logged off with empty password
    Given user has saved google account in the browser
    And user clicked on "Sign in with Google" button
    And webpage with a textfield for password is opened
    When User leaves password textfield empty
    And User clicks 'Next' button
    Then the error message appears "Enter password"

    Examples:
        | browsers       |
        | Chrome         |
        | FireFox        |
        | Microsoft Edge |
@tc:10

Scenario Outline: 3.1.1.1_11 Sign in with non-google account 
    Given user clicked on "Sign in with Google" button
    And webpage with a textfield is opened
    When User enters full existing email address of non-google account {email@yandex.ru} 
    And User clicks 'Next' button
    Then the error message appears that the google account has not been found
        
    Examples:
        | email       |
        | @yandex.ru  |
        | @mail.ru    |

@tc:11

Scenario Outline: 3.1.1.1_12 Sign in with another google account if the user is logged into 2 google accounts
    Given user is signed into 2 google accounts
    And user signed in the application with 1st google account
    And clicked the "Exit" button
    And the web page "Sign in with Google" button is opened
    When clicks  "Sign in with Google" button
    And the list of google accounts is appeared
    And the user chooses another account
    Then user is signed in
    And application webpage is oped
    And "New User" name can be changed
    And "Log Out" button is active
    And "Drop your CSV.." button is active

    Examples:
        | browsers       |
        | Chrome         |
        | FireFox        |
        | Microsoft Edge |
@tc:12

Scenario Outline: 3.1.1.1_13 Sign in with another google account if the user is logged out from both google accounts
    Given user signed into 2 google accounts
    And user llogged out from both goole accounts
    And user signed in the application with 1st google account
    And clicked the "Exit" button
    And the web page "Sign in with Google" button is opened
    When clicks  "Sign in with Google" button
    And the list of google accounts is appeared
    And the user chooses another account
    And the webpage with password textfield is opened
    And the user enters a valid password
    Then user is signed in
    And application webpage is oped
    And "New User" name can be changed
    And "Log Out" button is active
    And "Drop your CSV.." button is active

    Examples:
        | browsers       |
        | Chrome         |
        | FireFox        |
        | Microsoft Edge |
@tc:13