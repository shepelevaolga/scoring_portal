Feature: login_KA
Background: 
    Given installed and launched VPN on local PCt
    And user open https://qa.ddso-spot.quantori.com page
    And user clicks "signed in with google" button

Scenario: 1_1.1 Log in with valid login and password which were saved
   Given user has a Gmail account
   And user has login (<email>) and password for gmail account saved on the device
   When user clicks on this gmail account
   Then user sees the main page

   Examples:
   | email                          | 
   | anna.kalinina@quantoria.cademy |  

Scenario: 1_1.2 Log in with valid login and password
   Given user has a Gmail account
   And user has login and password for gmail account 
   And user chooses "change the account" button
   When user fills "login field" with valid login
   And clicks "next button"
   And user fills "password field" with  valid credentials
   Then user sees the main page

Scenario: 1_2.1 Log in with invalid password
    Given user has a google account
    When user fills a valid <email> in "login field"
    And user clicks "next button"
    And user fills invalid password in <password> field
    And user clicks "next button"
    Then user sees an error message 
    And "password field" marked witb red color
    Examples:
    | email                          |   password       |
    | anna.kalinina@quantori.academy |   wrong_password |

Scenario: 1_2.2 Log in with invalid login
    Given user has a google account
    When user fills a invalid <email> in "login field"
    And user clicks "next button"
    Then user sees an error message 
    And "login field" marked witb red color
    Examples:
    | email                              |  
    | anna.kalinina@quantori_not_academy |  

Scenario: 1_3.1 Log in with valid phone number 
   Given user has a gmail account with attached phone number to it
   When user clicks "change the account button"
   And fills <phone> number in the field
   And clicks "next button"
   And user fills valid <password> in the "password field"
   Then user sees the main page

   Examples:
   | phone        | password       |
   | +79123456789 | right_password |

Scenario: 1_3.2 Log in with invalid phone number 
   Given user has a gmail account with attached phone number to it
   When user clicks "change the account button"
   And fills invalid <phone> number in the field
   And clicks "next button"
   Then user sees error message 
   And "login field" is marked red

   Examples:
   | phone      |  
   | 9123456789 |  

Scenario: 1_3.3 Log in with valid phone number and invalid password
    Given user has a gmail account with attached phone number to it
    When user clicks "change the account button"
    And fills <phone> number in the field
    And clicks "next button"
    And user fills <invalid password> in the "<password> field"
    Then user sees error message 
    And "password field" is marked red
    
    Examples:
    | phone        | invalid password |
    | +79123456789 | wrong_password   |

Scenario: 1_4.1 Log in using another account, which is not google one
    Given user has yandex account
    When user clicks "change the account button"
    And user fills yndex <login>
    And clicks "next button"
    Then user sees the error message "google account is not finded" 
    And "login field" marked red

    Examples:
    | login               |  
    | viburnumk@yandex.ru |  

Scenario: 1_5.1 Log in with empty login
    Given user has a google account
    When user clicks "change the account button"
    And clicks "next button"
    Then user sees the error message "enter email address or phone number" 
    And "login field" marked red

Scenario: 1_5.2 Log in with empty password
    Given user has a google account
    When user clicks "change the account button"
    And fills valid login
    And clicks "next button"
    Then user sees the error message "enter password" 
    And "password field" marked red

Scenario: 1_6.1 Log in with fresh login
   Given user does not have a google account
   When user clicks "change the account button"
   And clicks "create an account button"
   And fills all required fields (<name>, <family name>, <user name>, <password>, <prove password>)
   And clicks "next button"
   And fills valid phone number
   And enter code, which system sent to the phone
   And fills reqired fields (<birth date>, <gender>)
   And clicks "next button"
   And clicks "skip button"
   And clicks "fast personolization"
   And clicks "next button"
   And clicks "prove button"
   And clicks "accept button"
   Then user sees a main page

    Examples:
    | name | family name | user name       | password | prove password | birth date | gender |
    | anna | kalinina    | annakalininarus | password | password       | 10.04.1995 | female |

   "well I actually did this, I understand that there are negative tests here as well, but I do not want to create a bunch of gmail accounts so I would like to skip them
   I was simply curious if creation of new account allows us log in directly, and turned out it is"

Scenario: 1_7.1 User log in with 2-factor authorisation on
    Given user has a google account
    And user clicked "change the account button"
    And filled the valid <email> in login field
    And clicked "next button"
    And filled the valid <password> in password field
    And clicked "next"
    When passes two-factor authentication
    Then user sees the main page

    Examples:
    | email                          | password       |
    | anna.kalinina@quantoria.cademy | right_password |