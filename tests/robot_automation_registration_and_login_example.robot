*** Settings ***
Documentation     Example for Registration and Login using SeleniumLibrary
Library           SeleniumLibrary

*** Variables ***
${URL}            https://example.com
${BROWSER}        Chrome
${USERNAME}       testuser_123
${PASSWORD}       SecurePass123!
${EMAIL}          testuser@example.com

*** Test Cases ***
Register and Login User
    Open Browser To Registration Page
    Register New User    ${USERNAME}    ${EMAIL}    ${PASSWORD}
    Login Existing User  ${USERNAME}    ${PASSWORD}
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Example Domain

Register New User
    [Arguments]    ${user}    ${email}    ${pass}
    Input Text      id=username_reg    ${user}
    Input Text      id=email_reg       ${email}
    Input Password  id=password_reg    ${pass}
    Click Button    id=submit_registration
    Wait Until Page Contains    Registration Successful

Login Existing User
    [Arguments]    ${user}    ${pass}
    Go To           https://example.com
    Input Text      id=login_user      ${user}
    Input Password  id=login_pass      ${pass}
    Click Button    id=login_button
    Wait Until Page Contains    Welcome, ${user}
