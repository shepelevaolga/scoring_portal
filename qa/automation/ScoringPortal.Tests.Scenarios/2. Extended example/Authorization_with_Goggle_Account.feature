Feature: 1.1 Authorization with Google Account

Background: 
  Given user opens application "Quantori scoring"
  And user clicks button "Sign in with Google"
  And Google's authorization page is opened


Scenario: 1.1.1 Happy path (logging in with valid credentials)
  Given user entered valid crendentials from his personal google account
  When user clicks "sign in"
  Then the main page of application is opened


Scenario: 1.1.2 Invalid credentials
  Scenario: 1.1.2.1 Invalid address of e-mail
     Given user entered invalid login (e-mail address)
     When user clicks "Next"
     Then authorization is failed because Google can't find the account

  Scenario: 1.1.2.2 Invalid password
     Given user entered valid login
     And user enters incorrect password
     When user clicks "sign in"
     Then authorization is failed because Google can't find the account


Scenario: 1.1.3 Authorization with another domain
  Given user entered valid e-mail from another domain (e.g. @mail.ru)
  When user clicks "next"
  Then authorization is failed because Google can't find the account


Scenario: 1.1.4 Pre-saved credentials of Google account in browser
  Given user has saved valid login and password of his Google account in browser
  And user chooses "Sign in as saved_account@gmail.com"
  When user clicks "sign in"
  Then the main page of application is opened


Scenario: 1.1.5 User tries to log-in with old password
  Given user changed his password
  And user haven't saved changes in his browser
  And user chooses automatic filling "password" field
  When user clicks "sign in"
  Then authorization is failed because Google can't find the account


Scenario: 1.1.6 Managed account
  Given user's account is managed by organization
  And user fill login and password forms with valid credentials
  When user clicks "sign in"
  Then the main page of application is opened