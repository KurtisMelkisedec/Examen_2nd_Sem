*** Settings ***
Library    RequestsLibrary
Variables    ./../po/variables.py


*** Keywords ***
Create Sessionttp
    Log To Console    ${BASE_URL}
    Create Session    ebay     url=${BASE_URL}    headers=${HEADERS}

Get Orders
    ${response}=    GET On Session    ebay  /   
    Should Be Equal As Strings    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    Log    ${json}
    RETURN    ${json}

Get Orders Bad
    ${response}=    GET On Session    ebay  /da 
    Should Be Equal As Strings    ${response.status_code}    404
    ${json}=    Set Variable    ${response.json()}
    Log    ${json}
    RETURN    ${json}

Get Order By Id
    [Arguments]    ${id}
    ${response}=    GET On Session    ebay   /${id} 
    Should Be Equal As Strings    ${response.status_code}    400
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}