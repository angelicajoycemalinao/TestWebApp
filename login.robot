*** Settings ***
Documentation   Login Script using Selenium with Robot Framework
Library     SeleniumLibrary
Resource    ../../PycharmProjects/TestLogin/common.robot

*** Test Cases ***
Test Case #1: Positive LogIn test
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Test Login
    Input Text    ${USERNAME_XPATH}    ${USERNAME}
    Input Password    ${PASSWORD_XPATH}     ${PASSWORD}
    Click Button    ${SUBMIT_BTN}
    Wait Until Location Contains   practicetestautomation.com/logged-in-successfully/
    Page Should Contain    Congratulations
    Page Should Contain    successfully logged in
    Page Should Contain Element     xpath://*[@id="loop-container"]/div/article/div[2]/div/div/div/a
    Close Browser

Test Case #2: Negative username test
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Test Login
    Input Text    ${USERNAME_XPATH}    ${INV_USERNAME}
    Input Password    ${PASSWORD_XPATH}     ${PASSWORD}
    Click Button    ${SUBMIT_BTN}
    Wait Until Page Contains    Your username is invalid!
    Close Browser

Test Case #3: Negative password test
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Test Login
    Input Text    ${USERNAME_XPATH}    ${USERNAME}
    Input Password    ${PASSWORD_XPATH}   ${INV_PASSWORD}
    Click Button    ${SUBMIT_BTN}
    Wait Until Page Contains    Your password is invalid!
    Close Browser