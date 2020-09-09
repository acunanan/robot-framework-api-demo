*** Settings ***
Documentation    This is a robot script that will upload wiremock stubs
...    retrieve upon successful post

Resource    ../resources/environment_variables.robot
Library    RequestsLibrary

*** Test Cases ***
Request should return HTTP response status code 200 WHEN GET /__admin/mappings is invoked
    Create Session    my_session    ${HOST}
    ${response}    Get request    my_session    /__admin/mappings
    Should be equal as strings    ${response.status_code}    200

*** Keywords ***

    Setup system under test