*** Settings ***
Resource    C:\\Users\\User\\RobotAutomationFramework\\resources\\api_keywords.robot

Suite Setup    Create API Session

*** Test Cases ***
TC_01_Create_User_API_Test
    ${payload}=    Load JSON Payload    testdata/user_payload.json
    ${response}=    Create User    ${payload}
    Validate Status Code    ${response}    201
    Validate Response Field    ${response}    name    Rinkoo
    Validate Response Field    ${response}    job     QA Automation Lead

TC_02_Get_User_API_Test
    ${response}=    Get User    2
    Validate Status Code    ${response}    200