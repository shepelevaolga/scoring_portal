Feature: 1.1 Sign in with user's Google Account 

Background:
	Given users created with a valid Google Account
	And user is on https://qa.ddso-spot.quantori.com/ page

@tc:5643
Scenario Outline: 1.1-01 Login page is displayed
	Given a link to login page
	When user opens a link
	Then Login page is displayed
	
@tc:6789
Scenario Outline: 1.1-02 User can log-in the application
	Given a valid user in "<Browser>" and "<OS>"
	When user logs-in with <"Login"> and <"Password">
	Then logging-in is successful
	And home page is displayed
	# PW technique was used (Browser, OS, and Login: number or mail)
Examples:
	| Browser         | OS      | Login                   | Password    |
	| Google Chrome   | Windows | +79646789067            | test1234    |
	| Microsoft Edge  | Windows | ivanov_ivan97@gmail.com | abcd1789    |
	| Opera           | Windows | tk2309@gmail.com        | snow3245    |
	| Mozilla FireFox | Windows | popov67@gmail.com       |TestPassw567 |
	| Google Chrome   | Mac     | tvk13@gmail.com         | test5678    |
	| Microsoft Edge  | Mac     | +79145678900            | passw!23    |
	| Opera           | Mac     | tatyanakravc@gmail.com  | TEST56!@    |
	| Mozilla FireFox | Mac     | +79245678934            | abcdTest1   |
	| Microsoft Edge  | Linux   | smirnovV@gmail.com      | TeatPas123  |
	| Mozilla FireFox | Linux   | TV123@gmail.com         | TaBcD123    |
	| Opera           | Linux   | +79141346789            | 12345Test   |
	| Google Chrome   | Linux   | +79634567890            | Tesst1783   |
	| Opera           | Windows | +78965678900            | TestPass12  |

@tc:6757
Scenario Outline: 1.1-03 User can log-out the application
	Given a valid logged-in user
	When user logs-out
	Then logging-out is successful
	And login page is displayed

@tc:9034
Scenario Outline: 1.1-04 Check authentication of logged-in user in a new tab
	Given a valid logged-in user in "<Browser>" and "<OS>" 
	When user opens home page in a new tab
	Then home page is opened
	And user is logged-in

Examples:
	| Browser         | OS      | 
	| Google Chrome   | Linux   | 
	| Google Chrome   | Mac     | 
	| Google Chrome   | Windows | 
	| Opera           | Linux   | 
	| Opera           | Mac     | 
	| Opera           | Windows | 
	| Microsoft Edge  | Mac     | 
	| Microsoft Edge  | Windows | 
	| Microsoft Edge  | Linux   | 
	| Mozilla FireFox | Windows |  
	| Mozilla FireFox | Linux   | 
	| Mozilla FireFox | Mac     | 

@tc:2345
Scenario Outline: 1.1-05 Home page is reloaded after log-out
	Given a valid logged-in user
	And home page link leads to home page
	When user log-out
	Then home page link leads to login page
	
@tc:4567
Scenario Outline: 1.1-07 User can't log-in to the application with incorrect credentials
	Given a valid user
	When user enters "<Login>" and "<Password>"
	Then logging-in is failed
	And "<WrongField>" is marked red
	And "<ErrorMessage>" is displayed

Examples:
	| Login              | Password  | WrongField | ErrorMessage |
	| @@                 | test1234  | Login      | Login        |
	| testUser@gmail.com | wrongtest | Password   | Password     |

@tc:7834
Scenario Outline: 1.1-08 Sign in with valid Password swapped with Login
	Given a valid user
	When user enters Password in Login field
	And try to continue logging-in
	Then Error message is displayed
	And Login field is marked red