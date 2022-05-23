Feature: 1. Sign in with Google Account

   Background:
      Given the user has a Google account

   Scenario: 1.1. The application link can be opened
      Given user has a link for the application
      When user clicks on the link
      Then the page should be opened

   Scenario: 1.2. The button "Sign in with Google" works
      Given user has the "sign in" page opened
      When user clicks on the button "Sign in with Google"
      Then the page for choosing a Google account should be opened

   Scenario: 1.3. The user can sign in (without logging-in before)
      Given user never logged in their Google account earlier on that device
      And user has the page for choosing a Google account opened
      When user enters their email/phone
      And user enters their password
      Then the page for downloading dataset should be opened

   Scenario: 1.4. The user can sign in (with logging-in before)
      Given user logged in their Google account earlier
      And user has the page for choosing a Google account opened
      When user clicks on their account
      Then page for downloading dataset should be opened

   Scenario: 1.5. The user can sign in (password wasn't saved)
      Given user logged in their Google account earlier but the password wasn't saved
      And user has the page for choosing a Google account opened
      When user clicks on their account
      And enters their password
      Then page for downloading dataset should be opened


