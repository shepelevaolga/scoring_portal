Feature: 1.1 Sign in with Google account

Background: 
Given user is on the https://qa.ddso-spot.quantori.com
And user follows "Sign in with Google"

@positive
Scenario: 1.1_01 Sign in with Google account from the list 
Given user has a Google account
And the sigh in form promts to choose an account 
And user already signed in to the Google account on the device
When user hits on his Google account 
Then user is signed in 
And user is on the main page 

Scenario: 1.1_02  Sign in with Google account from the list
Given user has a Google account
And the sigh in form promts to choose an account 
When user hits on his "<email>" Google account 
And fills in the valid "<password>"
And clicks "next" button 
Then user is on the main page 

Examples:
| email                    |  | password   |
| maria.a.rubina@gmail.com |  | Password1! |

Scenario: 1.1_03 Sign in with Google account with corporate domain (Google Workspace)
Given user has a corporate google account 
And user hits "change the account"
When user fills in valid phone number or "<email>"
And clicks "next" button 
And enters the valid "<password>"
Then user is on the main page 

Examples:
| email                         |  | password   |
| maria.rubina@quantori.academy |  | Password1! | 

Scenario: 1.1_04 Sign in with Google account using phone number
Given user has a Google account with a linked number
And user hits "change account"
When user fills in "<phone number>"
And hits "next" button
And fills in valid "<password>"
And clicks "next" button
Then user is on the main page 

Examples:
| phone number |  | password   |
| +79319740709 |  | Password1! |

@negative
Scenario: 1.1_05 Sign in with invalid password 
Given user has a Google account
And the sigh in form promts to choose an account 
When user hits on his "<email>" Google account 
And fills in the invalid "<password>"
And hits "next" button 
Then there is an error message and the "password" field marked red

Examples:
| email                   |  | password |
| marybober0702@gmail.com |  | 1234567  |

Scenario: 1.1_06 Sign in with Google account using invalid phone number
Given user has a Google account with a linked number
And user hits "change account"
When user fills in "<phone number>"
And hits "next" button
Then there is an error message and the field marked red

Examples:
| phone number |
| 92156787947  |

Scenario: 1.1_07 Sign in with other (not google) account
Given user has a Yandex account
And user hits "change account"
When user fills in an "<email>"
And clicks "next" button 
Then there is an error message "couldn't find a Google account" 
And the field is marked red 

Examples:
| email                 |
| mariarubina@yandex.ru |

Scenario: 1.1_08 Sign in with empty password 
Given user has a Google account
And the sigh in form promts to choose an account 
When user hits on his "email" Google account 
And leaves the "password" field empty
And clicks "next" button 
Then there is an error message and the "password" field marked red

Scenario: 1.1_09 Sign in with empty email
Given user has a Google account
And user hits "change account"
When user leaves an "email" field
And clicks "next" button 
Then there is an error message "enter an email or phone number" 
And the field is marked red 

@additional
Scenario: 1.1_10 Register a new Google account and sign in
Given user doesn't have a Google account
And hits "change user" button 
When hits "create account" 
And enter the following information 

Examples:
| field      |  | value               |
| First name |  | Maria               |
| Last name  |  | Rubina              |
| user name  |  | gmailfortesting2022 |
| password   |  | Password!!!!1111    |

And clicks "next" button
And enter the "<phone number>"

Examples:
| phone number |
| +79319740709 |

#that's it, i can't do this test, because i don't have free phone number for the test 

Scenario: 1.1._11 Sign in with Google account when two-factor autentification is set
Given user has a Google account
And the sigh in form promts to choose an account 
When user hits on his "<email>" Google account 
And fills in the valid "<password>"
And hits "next" button 
And enter the "<verification code>" that was sent to another devive
Then user is on the main page 

Examples:
| email                    |  | password  |  | verification code |
| maria.a.rubina@gmail.com |  | Pwd1!!!!1 |  | 219087            |



