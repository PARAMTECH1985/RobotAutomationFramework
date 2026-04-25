*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}     http://34.68.7.223:8083
${USERNAME}     mode
${PASSWORD}     12345678

*** Test Cases ***
Automated API Call With JWT
    # Step 1: Login and Get Token
    &{credentials}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}

    ${auth_resp}=      POST    ${BASE_URL}/api/auth/signin    json=${credentials}
    Should Be Equal As Strings    ${auth_resp.status_code}    200

    ${jwt_token}=      Set Variable    ${auth_resp.json()}[accessToken]
    Log    JWT Token is: ${jwt_token}

    # Step 2: Set Headers
    &{headers}=        Create Dictionary    Authorization=Bearer ${jwt_token}
    Log    Header is: ${headers}

    # Step 3: Call /api/test/user
    Log    Calling API: ${BASE_URL}/api/test/user
    ${user_resp}=      GET    ${BASE_URL}/api/test/user    headers=${headers}
    Log    User API Response: ${user_resp.text}
    Should Be Equal As Strings    ${user_resp.status_code}    200

    # Step 4: Call /api/test/all
    Log    Calling API: ${BASE_URL}/api/test/all
    ${all_resp}=       GET    ${BASE_URL}/api/test/all    headers=${headers}
    Log    All API Response: ${all_resp.text}
    Should Be Equal As Strings    ${all_resp.status_code}    200

#    # Step 5: Call /api/test/mod
#    Log    Calling API: ${BASE_URL}/api/test/mod
#    ${mod_resp}=       GET    ${BASE_URL}/api/test/mod    headers=${headers}
#    Log    Mod API Response: ${mod_resp.text}
#    Should Be Equal As Strings    ${mod_resp.status_code}    200
#
#    # Step 6: Call /api/test/admin
#    Log    Calling API: ${BASE_URL}/api/test/admin
#    ${admin_resp}=     GET    ${BASE_URL}/api/test/admin    headers=${headers}
#    Log    Admin API Response: ${admin_resp.text}
#    Should Be Equal As Strings    ${admin_resp.status_code}    200