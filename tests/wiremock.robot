*** Settings ***
Resource    ../resources/environment_variables.robot
Resource    ../resources/keywords/assertions.robot
Resource    ../resources/libraries.robot

*** Test Cases ***
Request should return HTTP response status code 200 WHEN GET /__admin/mappings is invoked
    Create Session    my_session    ${HOST}
    ${response}    Get request    my_session    /__admin/mappings
    Response Status Code Should Be    ${response}    200
    Delete All Sessions

Request should return response body WHEN GET /__admin/mappings is invoked
    Create Session    my_session    ${HOST}
    ${response}    Get request    my_session    /two
    Response Field Value Should Be    ${response}    $.mappings[1].response.body    Body content
    Delete All Sessions