*** Settings ***
Resource    ../resources/environment_variables.robot
Resource    ../resources/keywords/assertions.robot
Resource    ../resources/libraries.robot
Suite Setup    Run Keyword    Import Wiremock Stubs
Suite Teardown    Run Keyword    Cleanup Wiremock Server

*** Test Cases ***
Request should return HTTP response status code 200 WHEN GET /__admin/mappings is invoked
    Create Session    my_session    ${HOST}
    ${response}    Get request    my_session    /__admin/mappings
    Response Status Code Should Be    ${response}    200
    Delete All Sessions

Request should return response body WHEN wiremock server is hit
    Create Session    my_session    ${HOST}
    ${response}    Get request    my_session    /two
    Response Body Should Be    ${response}    Body content
    Delete All Sessions

*** Keywords ***
Import Wiremock Stubs
    ${body}    Get File    ${CURDIR}/../resources/wiremock/stubs.json
    Create Session    my_session    ${HOST}
    ${headers}    Create Dictionary    Content-Type=application/json
    ${response}    Post request    my_session    /__admin/mappings/import
    ...    data=${body}    headers=${headers}
    Response Status Code Should Be    ${response}    200
    Delete All Sessions

Cleanup Wiremock Server
    Create Session    my_session    ${HOST}
    ${response}    Delete request    my_session    /__admin/mappings
    Response Status Code Should Be    ${response}    200
    Delete All Sessions