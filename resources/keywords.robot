*** Settings ***
Library    AppiumLibrary
Resource   ../variables/variables.robot

*** Keywords ***

Open Mobile Application
    Open Application
    ...    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP_PATH}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    fullReset=${True}
    ...    noReset=${False}

Input Username
    [Arguments]    ${username}
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Username"]    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Password"]    ${password}

Click Login Button
    Click Element    xpath=//android.view.ViewGroup[@content-desc="test-LOGIN"]

Verify Login Success
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="PRODUCTS"]

Verify Login Failed
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Username and password do not match any user in this service."]

Logout
    Click Element    xpath=//*[@content-desc="test-Menu"]
    Click Element    xpath=//*[@content-desc="test-LOGOUT"]