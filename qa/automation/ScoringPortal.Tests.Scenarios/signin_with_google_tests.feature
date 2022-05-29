

Feature: sign-in via google account

    """
    since we're going to check only the functionality of application to 
    sign-in with google the last one itself shouldn't be checked 
    """

    Background:
        Given valid email, password for google account without 2-step verification
        # in order to run .py test 
        And the vpn is used
        And we already have "https://qa.ddso-spot.quantori.com/" aplication
        # And the field 'email' is empty
        # And the field 'password' is empty


    Scenario: sign-in successfully
        Given  a set of valid data
        # let's pretend login 'user1@quantori.academy' with the password
        # 12345678 is a valid data since i don't want to show mine :)
        |email                  | password |
        | user@quantori.academy | 12345678 |
        
        And sign in google account
        And enter email into "email" field
        And click <next> button
        And type the password into the "password" field
        And click <next> button
        And use_openvnp_config is True
        When we go to the application i click sign-in with google button
        | application                        | use_openvnp_config  |
        | https://qa.ddso-spot.quantori.com/ |  True               |
        Then we will see a scoring page
        And "New User" icon at the left corner

    Scenario: using a valid phone_number attached to email
        Given  a set of valid data
        # let's pretend login 'user1@quantori.academy' with the password
        # 12345678 and a phone number +71234567891
        # are valid data 
        |phone_number    | password |
        | +71234567891   | 12345678 |
        
        And sign in google account
        And enter '71234567891' into "email" field
        And click <next> button
        And type the password into the "password" field
        And click <next> button
        And use_openvnp_config is True
        When we go to the application i click sign-in with google button
        | application                        | use_openvnp_config  |
        | https://qa.ddso-spot.quantori.com/ |  True               |
        Then we will see a scoring page
        And "New User" icon at the left corner
    
    Scenario: wrong email
        Given invalid_data
        |application                        | login            | password |
        |https://qa.ddso-spot.quantori.com/ | user@quanto.acad | 12345678 |
        
        When I go to the application itself
        And type login 'user@quanto.acad' in 'email'
        And click <next> button
        Then I should see "Couldn't find your Google Account" error

    Scenario: wrong password
        Given invalid_data
        | application                        | login                 | password | 
        | https://qa.ddso-spot.quantori.com/ | user@quantori.academy | 1234     |
        
        When I go to the application itself
        And type login 'user@quanto.acad' in 'email'
        And click <next> button
        And type password '1234' in 'password' field
        And click <next> button
        Then I should see "Invalid password" error

    Scenario: not using vpn
        Given not using vpn
        When i go to "https://qa.ddso-spot.quantori.com"
        Then the page should_not be loaded

