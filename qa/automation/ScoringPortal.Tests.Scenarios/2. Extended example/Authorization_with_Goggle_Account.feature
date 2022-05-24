Feature: 1.1 Authorization with Google Account

Background: 
  Given user opens application "Quantori scoring"
  And user clicks button "Sign in with Google"
  And Google's authorization page is opened


Scenario: 1.1.1 Happy path
  Given user enters valid crendentials from his personal google account
  When user clicks "sign in"
  Then the main page of application is opened


Scenario: 1.1.2 Invalid credentials
  Scenario: 1.1.2.1 Invalid address of e-mail
     Given user enters invalid login (e-mail address)
     When user clicks "Next"
     Then authorization is failed because Google can't find the account

  Scenario: 1.1.2.2 Invalid password
     Given user enters valid login
     And user enters incorrect password
     When user clicks "sign in"
     Then authorization is failed because Google can't find the account


Scenario: 1.1.3 Authorization with another domain
  Given user enters valid e-mail from another domain (e.g. @mail.ru)
  When user clicks "next"
  Then authorization is failed because Google can't find the account


Scenario: 1.1.4 Pre-saved credentials of Google account in browser
  Given user has saved valid login and password of his Google account in browser
  And user choses "Sign in as saved_account@gmail.com"
  When user clicks "sign in"
  Then the main page of application is opened


Scenario: 1.1.5 not updated password in browser
  Given user changed his password
  And user haven't saved changes in his browser
  And user choses automatic filling "password" field
  When user clicks "sign in"
  Then authorization is failed because Google can't find the account


Scenario: 1.1.6 Managed account
  Given user's account is managed by organization
  And user fill login and password forms with valid credentials
  When user clicks "sign in"
  Then the main page of application is opened