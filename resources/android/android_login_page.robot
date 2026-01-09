*** Settings ***
Library            AppiumLibrary
Library            OperatingSystem
Library            Collections
 

*** Variables ***
${PLATFORM_NAME}       Android
${PLATFORM_VERSION}    16
${DEVICE_NAME}         emulator-5554
${AUTOMATION_NAME}     UiAutomator2
${APP}                 /Users/jfranccr/Documents/app.apk
${ALLOW_BUTTON}        com.android.permissioncontroller:id/permission_allow_button
${BUTTON_SIGNiN}       xpath=//android.widget.TextView[@text="Sign in with Email"]

${FIELD_EMAIL}         xpath=//android.widget.EditText[@resource-id="ion-input-0"]
${FIELD_PASSWORD}      xpath=//android.widget.EditText[@resource-id="ion-input-1"]
${BUTTON_SIGIN_WITH_EMAIL}    xpath=//android.widget.Button[@text="Sign In With Email"]
*** Keywords ***

Abrir Aplicativo Android Local
     Open Application    http://127.0.0.1:4723/wd/hub
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    app=${APP}


Acessar app connect android 
    [Arguments]        ${EMAIL}       ${PASSWORD}      ${EXPECTED_MESSAGE}
    Wait Until Element Is Visible    id=${ALLOW_BUTTON}    20s
    Click Element    id=${ALLOW_BUTTON}
    Wait Until Element Is Visible    ${BUTTON_SIGNiN}    10s
    Click Element                    ${BUTTON_SIGNiN}
    Wait Until Element Is Visible    ${FIELD_EMAIL}    timeout=10s
    Input Text                       ${FIELD_EMAIL}    ${EMAIL}
    Wait Until Element Is Visible    ${FIELD_PASSWORD}    timeout=10s
    Input Text                       ${FIELD_PASSWORD}    ${EMAIL}
    Click Element                    ${BUTTON_SIGIN_WITH_EMAIL}
    Sleep                           time_=3s
    Wait Until Page Contains         ${EXPECTED_MESSAGE}      10s

Validar que seguintes abas estao sendo exibidas na tela home
    [Arguments]        ${PAGE_HOME}    ${PAGE_SOCIAL-RADAR}        ${PAGE_INFLUENCERS}           ${PAGE_ALERTS}        ${PAGE_VIEW-MORE}
    Wait Until Page Contains         ${PAGE_HOME}              10s
    Wait Until Page Contains         ${PAGE_SOCIAL-RADAR}      10s
    Wait Until Page Contains         ${PAGE_INFLUENCERS}       10s
    Wait Until Page Contains         ${PAGE_ALERTS}       10s
    Wait Until Page Contains         ${PAGE_VIEW-MORE}         10s




