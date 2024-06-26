*** Settings ***
Documentation   Login Script using Selenium with Robot Framework
Library     SeleniumLibrary
Resource    ../../PycharmProjects/TestLogin/common.robot

*** Test Cases ***
Test case 1: Positive LogIn test
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Test Login
    Input Text    ${USERNAME_XPATH}    student
    Input Password    ${PASSWORD_XPATH}    Password123
    Click Element    ${SUBMIT_BTN}
    Wait Until Location Contains   practicetestautomation.com/logged-in-successfully/
    Page Should Contain    Congratulations
    Page Should Contain    successfully logged in
    Page Should Contain Element    id:loop-container
    Close Browser

Test case 2: Negative username test
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
    Input Text    ${USERNAME_XPATH}    ${INV_USERNAME}
    Input Password    ${PASSWORD_XPATH}     ${PASSWORD}
    Click Element    ${SUBMIT_BTN}
    Page Should Contain     Your username is invalid!
    Close Browser

Test case 3: Negative password test
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
    Input Text    ${USERNAME_XPATH}    ${USERNAME}
    Input Password    ${PASSWORD_XPATH}   ${INV_PASSWORD}
    Click Element    ${SUBMIT_BTN}
    Page Should Contain     Your password is invalid!
    Close Browser