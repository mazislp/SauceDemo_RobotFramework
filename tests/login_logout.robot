*** Settings ***
Library    AppiumLibrary
Resource   ../resources/keywords.robot
Resource   ../variables/variables.robot

Test Setup    Open Mobile Application
Test Teardown    Close Application

*** Test Cases ***

Login Positive Test
    Input Username    ${VALID_USERNAME}
    Input Password    ${VALID_PASSWORD}
    Click Login Button
    Verify Login Success

Login Negative Test
    Input Username    ${INVALID_USERNAME}
    Input Password    ${INVALID_PASSWORD}
    Click Login Button
    Verify Login Failed