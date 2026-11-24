*** Settings ***
Resource          ../../resources/main_resources.robot
Suite Setup       Carregar Credenciais De Teste
Test Setup        Abrir Aplicativo Android
Test Teardown     Run Keyword And Ignore Error    Fechar Aplicativo Android
Test Tags         home_tests


*** Test Cases ***
MARTGNM-T379 Validar "GO TO APPROVALS" tela home
    Acessar app connect android    ${TEST_USER_EMAIL}    ${TEST_USER_PASSWORD}    Welcome
    Validar que seguintes abas estao sendo exibidas na tela home
    ...    Home
    ...    Social Radar
    ...    Influencers
    ...    Alerts
    ...    View More
    Clicar no botao GO TO APPROVALS
    Entao devo ser direcionado para tela de aprovaçao de Influencers    Influencer Activity

MARTGNM-T440 Validar que ao clicar na aba "Alerts" na pagina home seja direcionado para tela "alerts"
    Acessar app connect android    ${TEST_USER_EMAIL}    ${TEST_USER_PASSWORD}    Welcome
    Validar que seguintes abas estao sendo exibidas na tela home
    ...    Home
    ...    Social Radar
    ...    Influencers
    ...    Alerts
    ...    View More
    Clicar no Icone "Alerts"
    Entao a pagina Alerts contem as seguintes seções    Brand Alerts    Global News

MARTGNM-T441 Validar seção Tools "Social Radar"
    Acessar app connect android    ${TEST_USER_EMAIL}    ${TEST_USER_PASSWORD}    Welcome
    Validar que seguintes abas estao sendo exibidas na tela home
    ...    Home
    ...    Social Radar
    ...    Influencers
    ...    Alerts
    ...    View More
    Clicar no Icone "Social Radar"
    Ir para aba Dashboards
    Swipe até o elemento esta visivel    ${FOLLOW_PASSION_POINTS}
    Entao o titulo da pagina é exibido...    Social Radar

MARTGNM-T442 Validar seção View All Alerts
    Acessar app connect android    ${TEST_USER_EMAIL}    ${TEST_USER_PASSWORD}    Welcome
    Validar que seguintes abas estao sendo exibidas na tela home
    ...    Home
    ...    Social Radar
    ...    Influencers
    ...    Alerts
    ...    View More
    Ir para view All Alerts
    Entao a pagina Alerts contem as seguintes seções    Brand Alerts    Global News

MARTGNM-T378 Validar logout do app
    Acessar app connect android    ${TEST_USER_EMAIL}    ${TEST_USER_PASSWORD}    Welcome
    Validar que seguintes abas estao sendo exibidas na tela home
    ...    Home
    ...    Social Radar
    ...    Influencers
    ...    Alerts
    ...    View More
    Ir para fazer Logout
    Entao devo ser redirecionado para tela de login    Please log in with your ABI credentials

MARTGNM-T384 Validar seção education no canto inferior da tela
    Acessar app connect android    ${TEST_USER_EMAIL}    ${TEST_USER_PASSWORD}    Welcome
    Validar que seguintes abas estao sendo exibidas na tela home
    ...    Home
    ...    Social Radar
    ...    Influencers
    ...    Alerts
    ...    View More
    Ir para tela de Education
    Entao deve ser exibidas as abas na secao education
    ...    Policies & Process
    ...    Social Radar
    ...    Influencers
    ...    Alerts
    Swipe até o elemento esta visivel    ${TEXTO_EDUCATION}
