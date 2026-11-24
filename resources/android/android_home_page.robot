*** Settings ***
Documentation       Page Object: home, navegação e logout.
Library             AppiumLibrary


*** Variables ***
${ICONE_ALERTS}              xpath=//android.view.View[@text="Alerts"]
${ICONE_SOCIAL_ALERTS}      xpath=//android.view.View[@text="Social Radar"]
${ABA_DASHBOARDS}            xpath=//android.webkit.WebView[@text="Connect"]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TabWidget/android.view.View[2]/android.widget.TextView
${FOLLOW_PASSION_POINTS}     xpath=//android.view.View[@text="Follower Passion Points"]/android.view.View[2]
${ICONE_VIEW_ALL_ALERTS}     xpath=//android.view.View[@resource-id="inline_target"]/android.view.View[2]/android.view.View/android.widget.Image
${CTA_VIEW_ALL_ALERTS}       xpath=//android.view.View[@text="Latest Alerts"]/android.view.View[1]
${BOTAO_LOGOUT}              xpath=//android.view.View[@text="Logout"]
${TEXTO_EDUCATION}           xpath=//android.widget.TextView[@text="Here, we provide real-time risk assessment and sensitive topic guidelines to better inform our community managers and social media teams as they encounter and engage with our social audiences, and also gauge when social activity may require an escalation"]


*** Keywords ***
Clicar no botao GO TO APPROVALS
    Wait Until Page Contains    GO TO APPROVALS    10s
    Click Text    GO TO APPROVALS

Entao devo ser direcionado para tela de aprovaçao de Influencers
    [Arguments]    ${titulo_esperado_pagina}
    Wait Until Page Contains    Got it!    10s
    Click Text    Got it!
    Wait Until Page Contains    Skip It
    Click Text    Skip It
    Wait Until Page Contains    ${titulo_esperado_pagina}    10s

Clicar no Icone "Alerts"
    Click Element    ${ICONE_ALERTS}

Ir para aba Dashboards
    Wait Until Element Is Visible    ${ABA_DASHBOARDS}    10s
    Click Element    ${ABA_DASHBOARDS}

Entao o titulo da pagina é exibido...
    [Arguments]    ${titulo_esperado_pagina}
    Wait Until Page Contains    ${titulo_esperado_pagina}

Clicar no Icone "Social Radar"
    Click Element    ${ICONE_SOCIAL_ALERTS}

Swipe até o elemento esta visivel
    [Arguments]    ${locator}
    ${x}    Get Window Width
    ${y}    Get Window Height
    ${start_x}    Evaluate    ${x} / 2
    ${start_y}    Evaluate    ${y} / 2
    FOR    ${_}    IN RANGE    20
        ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    0.5s
        Exit For Loop If    ${status}
        Swipe    start_x=${start_x}    start_y=${start_y}    end_x=${start_x}    end_y=0
    END

Swipe Until Element Is Visible With Offset
    [Arguments]    ${locator}
    ${x}    Get Window Width
    ${y}    Get Window Height
    ${start_x}    Evaluate    ${x} - 100
    ${start_y}    Set Variable    20
    FOR    ${_}    IN RANGE    20
        ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    0.5s
        Exit For Loop If    ${status}
        Swipe    start_x=${start_x}    start_y=${start_y}    end_x=${start_x}    end_y=0
    END

Ir para view All Alerts
    Wait Until Element Is Visible    ${CTA_VIEW_ALL_ALERTS}    10s
    Click Element    ${CTA_VIEW_ALL_ALERTS}

Entao a pagina Alerts contem as seguintes seções
    [Arguments]    ${aba_esperada_pagina}    ${aba_esperada_pagina_2}
    Wait Until Page Contains    ${aba_esperada_pagina}    10s
    Wait Until Page Contains    ${aba_esperada_pagina_2}    10s

Ir para fazer Logout
    Click Text    View More
    Wait Until Element Is Visible    ${BOTAO_LOGOUT}
    Click Element    ${BOTAO_LOGOUT}
    Wait Until Page Contains    YES    1s
    Click Text    YES

Entao devo ser redirecionado para tela de login
    [Arguments]    ${titulo_esperado_pagina}
    Wait Until Page Contains    ${titulo_esperado_pagina}

Ir para tela de Education
    Click Text    View More
    Wait Until Page Contains    Education    10s
    Click Text    Education

Entao deve ser exibidas as abas na secao education
    [Arguments]    ${tab_policies}    ${tab_social_radar}    ${tab_influencers}    ${tab_alerts}
    Wait Until Page Contains    ${tab_policies}    10s
    Click Text    ${tab_policies}
    Wait Until Page Contains    ${tab_social_radar}    10s
    Click Text    ${tab_social_radar}
    Wait Until Page Contains    ${tab_influencers}    10s
    Click Text    ${tab_influencers}
    Wait Until Page Contains    ${tab_alerts}    10s
    Click Text    ${tab_alerts}
