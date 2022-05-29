# i really don't know if this will work
# because i didn't want to kinda litter any of my virtual envs
# but nevertheless not to make boring tests 
# i tried to implement of one of them
import pytest 
from behave import *
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
# from selenium.webdriver.common.keys import Keys

# behave lib should read all the .feature files
# in the directory the .py file in
@given('a set of valid data')
def step_impl(context):
    try:
        for r in context.table:
            assert len(context.table) == 1, f'Please provide only 1 row in the table {context.table}'
            driver = webdriver.Chrome()#ChromeDriverManager().install())
            driver.get(r'https://accounts.google.com/signin/v2/identifier?' + \
                'hl=en&flowName=GlifWebSignIn&flowEntry=ServiceLogin')
            driver.implicitly_wait(3)

            login_input = driver.find_element_by_xpath('//*[@id ="identifierId"]')
            login_input.send_keys(r.email)

            _next = driver.find_elements_by_xpath('//*[@id ="identifierNext"]')
            _next[0].click()

            pass_input = driver.find_element_by_xpath('//*[@id ="password"]/div[1]/div / div[1]/input')
            pass_input.send_keys(r.password)

            _next = driver.find_elements_by_xpath('//*[@id ="passwordNext"]')
            _next[0].click()


    except:
        raise AssertionError(f"Well, google log-on with provided data {context.table} failed")

# okay, after we've successfully signed in google account
# we can go for the next step - try to use it for the application
@when('we go to the application i click sign-in with google button')
def step_impl(context):
    try:
        for r in context.table:
            assert len(context.table) == 1, f'Please provide only 1 row in the table {context.table}'
            driver = webdriver.Chrome()#ChromeDriverManager().install())
            # assertion for using vpn
            # (i don't know how to check it but it must be used ¯\_(ツ)_/¯)
            assert r.use_openvpn_config == True, f'You should use VPN when trying to sign-in application'
            # get url
            driver.get(r.application)
            driver.implicitly_wait(3)
            # i'm not so good in web (actually i'm working in cv projects)
            # but if we don't have any class 
            # we can identify element with text()
            already_googled = driver.find_elements_by_xpath('//span[contains(text(), "Sign in with Google")]')
            already_googled[0].click()
            driver.implicitly_wait(1)
    except:
        raise AssertionError(f"Well, log-on with provided data {context.table} failed")

# and then we somehow should make sure
# that we on the page and logging was successful
# so let's try to find an element to drop csv files
@then('we will see a scoring page')
def step_impl(context):
    try:
        driver = webdriver.Chrome()
        driver.get(r'https://qa.ddso-spot.quantori.com')
        driver.implicitly_wait(3)
        element = driver.find_elements_by_xpath("//*[contains(text(), 'Drop your CSV file here or click to browse')]")

    except:
        raise AssertionError(f"Smth is wrong: can't find element with droping data on the page")
