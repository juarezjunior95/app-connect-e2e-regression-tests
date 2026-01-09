*** Settings ***
Library            AppiumLibrary
Library            OperatingSystem
Library            Collections
 

*** Variables ***


${ICONE_ALERTS}                        xpath=//android.view.View[@text="Alerts"]
${ICONE_SOCIAL-ALERTS}                 xpath=//android.view.View[@text="Social Radar"]
${ABA_DASHBOARDS}                      xpath=//android.webkit.WebView[@text="Connect"]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.TabWidget/android.view.View[2]/android.widget.TextView
${FOLLOW_PASSION_POINTS}               xpath=//android.view.View[@text="Follower Passion Points"]/android.view.View[2]
${ICONE_VIEW-ALL-ALERTS}               xpath=//android.view.View[@resource-id="inline_target"]/android.view.View[2]/android.view.View/android.widget.Image
${CTA_VIEW-ALL-ALERTS}                 xpath=//android.view.View[@text="Latest Alerts"]/android.view.View[1]
${BOTAO_LOGOUT}                        xpath=//android.view.View[@text="Logout"]
${TEXTO_EDUCATION}                     xpath=//android.widget.TextView[@text="Here, we provide real-time risk assessment and sensitive topic guidelines to better inform our community managers and social media teams as they encounter and engage with our social audiences, and also gauge when social activity may require an escalation"]
*** Keywords ***

Clicar no botao GO TO APPROVALS
    Wait Until Page Contains        GO TO APPROVALS    timeout=10s
    Click Text                      GO TO APPROVALS
    
Entao devo ser direcionado para tela de aprovaçao de Influencers
    [Arguments]                      ${TITULO_ESPERADO_PAGINA}
    Wait Until Page Contains         Got it!        10s
    Click Text                       Got it!
    Wait Until Page Contains         Skip It
    Click Text                       Skip It
    Wait Until Page Contains         ${TITULO_ESPERADO_PAGINA}            10s

Clicar no Icone "Alerts"
    Click Element                     ${ICONE_ALERTS}
Ir para aba Dashboards
    Wait Until Element Is Visible     ${ABA_DASHBOARDS}                   10s
    Click Element                     ${ABA_DASHBOARDS}
Entao o titulo da pagina é exibido...
    [Arguments]                      ${TITULO_ESPERADO_PAGINA}
    Wait Until Page Contains         ${TITULO_ESPERADO_PAGINA}

Clicar no Icone "Social Radar"
    Click Element                     ${ICONE_SOCIAL-ALERTS}
Swipe até o elemento esta visivel
    [Arguments]                    ${LOCATOR}
    
    ${x}  Get Window Width
    ${y}  Get Window Height

    ${start_x}  Evaluate  ${x} / 2
    ${start_y}  Evaluate  ${y} / 2

    WHILE    ${True}    limit=20
        ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOCATOR}    timeout=0.5

        IF    ${status}
            Exit For Loop
        END

        Swipe    
        ...    start_x=${start_x}
        ...    start_y=${start_y}
        ...    end_x=${start_x}
        ...    end_y=0
    END 



Swipe Until Element Is Visible With Offset
    
    [Arguments]    ${LOCATOR}
    ${x}    Get Window Width
    ${y}    Get Window Height

    # Coordenadas iniciais (começa no centro da tela, Y fixo em 20 ou meio da tela)
    ${start_x}    Evaluate    ${x} - 100
    ${start_y}    Set Variable    20
    ${end_x}      Evaluate    ${start_x} - 537
    ${end_y}      Set Variable    ${start_y}
    WHILE    ${True}    limit=20
        ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOCATOR}    timeout=0.5
        IF    ${status}
            Exit For Loop
        END

        Swipe   
        ...    start_x=${start_x}
        ...    start_y=${start_y}
        ...    end_x=${start_x}
        ...    end_y=0
    END


    


Ir para view All Alerts
    Wait Until Element Is Visible                ${CTA_VIEW-ALL-ALERTS}     10s
    Click Element                                ${CTA_VIEW-ALL-ALERTS}


Entao a pagina Alerts contem as seguintes seções
    [Arguments]       ${ABA_ESPERADA_PAGINA}       ${ABA_ESPERADA_PAGINA_2}
    Wait Until Page Contains        ${ABA_ESPERADA_PAGINA}                  10S
    Wait Until Page Contains        ${ABA_ESPERADA_PAGINA_2}                10S

Ir para fazer Logout
    Click Text                        View More
    Wait Until Element Is Visible     ${BOTAO_LOGOUT}
    Click Element                     ${BOTAO_LOGOUT}
    Wait Until Page Contains          YES            1.0s
    Click Text                        YES
Entao devo ser redirecionado para tela de login
    [Arguments]                        ${TITULO_ESPERADO_PAGINA}
    Wait Until Page Contains           ${TITULO_ESPERADO_PAGINA}


Ir para tela de Education
    Click Text                        View More
    Wait Until Page Contains            Education        10s
    Click Text                          Education 

Entao deve ser exibida as seguintes abas..
    [Arguments]        ${Policies & Process}        ${Social Radar}            ${Influencers}      ${Alerts}
    Wait Until Page Contains            ${Policies & Process}        10s
    Click Text                          ${Policies & Process} 
    Wait Until Page Contains            ${Social Radar}        10s
    Click Text                          ${Social Radar} 
    Wait Until Page Contains            ${Influencers}         10s
    Click Text                          ${Influencers} 
    Wait Until Page Contains            ${Alerts}        10s
    Click Text                          ${Alerts} 
              