*** Settings ***
Documentation       Page Object: fluxo de login e validações da home pós-login.
Library             AppiumLibrary


*** Variables ***
${ALLOW_BUTTON}                   com.android.permissioncontroller:id/permission_allow_button
${BUTTON_SIGN_IN}                 xpath=//android.widget.TextView[@text="Sign in with Email"]
${FIELD_EMAIL}                    xpath=//android.widget.EditText[@resource-id="ion-input-0"]
${FIELD_PASSWORD}                 xpath=//android.widget.EditText[@resource-id="ion-input-1"]
${BUTTON_SIGN_IN_WITH_EMAIL}      xpath=//android.widget.Button[@text="Sign In With Email"]


*** Keywords ***
Acessar app connect android
    [Arguments]    ${email}    ${password}    ${expected_message}
    Wait Until Element Is Visible    id=${ALLOW_BUTTON}    20s
    Click Element    id=${ALLOW_BUTTON}
    Wait Until Element Is Visible    ${BUTTON_SIGN_IN}    10s
    Click Element    ${BUTTON_SIGN_IN}
    Wait Until Element Is Visible    ${FIELD_EMAIL}    10s
    Input Text    ${FIELD_EMAIL}    ${email}
    Wait Until Element Is Visible    ${FIELD_PASSWORD}    10s
    Input Text    ${FIELD_PASSWORD}    ${password}
    Click Element    ${BUTTON_SIGN_IN_WITH_EMAIL}
    Sleep    3s
    Wait Until Page Contains    ${expected_message}    10s

Validar que seguintes abas estao sendo exibidas na tela home
    [Arguments]
    ...    ${page_home}
    ...    ${page_social_radar}
    ...    ${page_influencers}
    ...    ${page_alerts}
    ...    ${page_view_more}
    Wait Until Page Contains    ${page_home}    10s
    Wait Until Page Contains    ${page_social_radar}    10s
    Wait Until Page Contains    ${page_influencers}    10s
    Wait Until Page Contains    ${page_alerts}    10s
    Wait Until Page Contains    ${page_view_more}    10s
