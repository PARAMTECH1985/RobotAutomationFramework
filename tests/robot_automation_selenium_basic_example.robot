*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://www.google.com

*** Test Cases ***
Search Google And Verify Results
    Open Browser To Google
    Search For Term    Robot Framework
    Verify Result Contains    Robot Framework
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Google
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Search For Term
    [Arguments]    ${search_term}
    Input Text      name=q    ${search_term}
    Press Keys      name=q    ENTER

Verify Result Contains
    [Arguments]    ${expected_text}
    Wait Until Page Contains    ${expected_text}
