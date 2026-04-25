*** Settings ***
Library    JSONLibrary

*** Test Cases ***
Parse Complex JSON With JSONPath
    ${json_string}=    Set Variable    {"user": {"id": 101, "details": {"name": "John Doe", "roles": ["admin", "editor"]}}}
    ${json_obj}=       Convert String To Json    ${json_string}

    # Extract the name using JSONPath
    ${names}=          Get Value From Json    ${json_obj}    $.user.details.name
    Log To Console     Extracted Name: ${names[0]}

    # Extract the first role from the array
    ${first_role}=     Get Value From Json    ${json_obj}    $.user.details.roles[0]
    Should Be Equal    ${first_role[0]}       admin
