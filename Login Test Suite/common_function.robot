*** Variables ***
${URL}              https://practicetestautomation.com/practice-test-login/
${BROWSER}          Chrome

*** Keywords ***
Open Browser And Navigate to Test Login Page
    [Arguments]     ${url}   ${browser}
    Open Browser    ${url}   ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Test Login