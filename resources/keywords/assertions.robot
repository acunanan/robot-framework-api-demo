*** Keywords ***
Response Status Code Should Be
    [Arguments]    ${response}    ${status_code}
    Should Be Equal As Strings    ${response.status_code}    ${status_code}

Response Field Value Should Be
    [Arguments]    ${response}    ${json_path}    ${expected_value}
    #${resp}    Convert String to JSON    ${response.content}
    ${actual_value}    Get Value From Json    ${response.json()}    ${json_path}
    Should Be Equal    ${actual_value}    ${expected_value}