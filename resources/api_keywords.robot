*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    OperatingSystem
Resource   variables.robot

*** Keywords ***
Create API Session
    Create Session    reqres    ${BASE_URL}    verify=True

Create User
    [Arguments]    ${payload}
    ${response}=    POST On Session    reqres    ${USER_ENDPOINT}    json=${payload}
    RETURN    ${response}

Get User
    [Arguments]    ${user_id}
    ${response}=    GET On Session    reqres    ${USER_ENDPOINT}/${user_id}
    RETURN    ${response}

Validate Status Code
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Integers    ${response.status_code}    ${expected_status}

Validate Response Field
    [Arguments]    ${response}    ${field}    ${expected_value}
    ${json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${json}[${field}]    ${expected_value}

Load JSON Payload
    [Arguments]    ${file_path}
    ${json_data}=    Load JSON From File    ${file_path}
    RETURN    ${json_data}