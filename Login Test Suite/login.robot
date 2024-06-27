*** Settings ***
Documentation   Login Script using Selenium with Robot Framework
Library     SeleniumLibrary
Resource    common_function.robot
Suite Teardown      Close All Browsers

*** Variables ***
${USERNAME_XPATH}   id:username
${PASSWORD_XPATH}   id:password
${USERNAME}         student
${PASSWORD}         Password123
${INV_USERNAME}     incorrectUser
${INV_PASSWORD}     incorrectPassword
${SUBMIT_BTN}       id:submit

*** Test Cases ***
Test Case #1: Positive LogIn test
    [Documentation]     Test case for successful login
    Open Browser And Navigate to Test Login Page     ${URL}   ${BROWSER}
    Input Text    ${USERNAME_XPATH}    ${USERNAME}
    Input Password    ${PASSWORD_XPATH}     ${PASSWORD}
    Click Button    ${SUBMIT_BTN}
    Wait Until Location Contains   practicetestautomation.com/logged-in-successfully/
    Page Should Contain     Congratulations
    Page Should Contain    successfully logged in
    Page Should Contain Element     xpath://*[@id="loop-container"]/div/article/div[2]/div/div/div/a
    Close Browser

Test Case #2: Negative username test
    [Documentation]     Test case for invalid username login
    Open Browser And Navigate to Test Login Page     ${URL}   ${BROWSER}
    Input Text    ${USERNAME_XPATH}    ${INV_USERNAME}
    Input Password    ${PASSWORD_XPATH}     ${PASSWORD}
    Click Button    ${SUBMIT_BTN}
    Wait Until Page Contains    Your username is invalid!
    Close Browser

Test Case #3: Negative password test
    [Documentation]     Test case for invalid password login
    Open Browser And Navigate to Test Login Page     ${URL}   ${BROWSER}
    Input Text    ${USERNAME_XPATH}    ${USERNAME}
    Input Password    ${PASSWORD_XPATH}   ${INV_PASSWORD}
    Click Button    ${SUBMIT_BTN}
    Wait Until Page Contains    Your password is invalid!
    Close Browser



