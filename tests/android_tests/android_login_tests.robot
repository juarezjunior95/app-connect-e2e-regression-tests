*** Settings ***
Resource          ../../resources/main_resources.robot
Suite Setup       Carregar Credenciais De Teste


*** Test Cases ***
MARTGNM-T375- Validar login com credencias validas
    [Tags]    login_test
    Abrir Aplicativo Android
    Acessar app connect android    ${TEST_USER_EMAIL}    ${TEST_USER_PASSWORD}    Welcome
    Validar que seguintes abas estao sendo exibidas na tela home
    ...    Home
    ...    Social Radar
    ...    Influencers
    ...    Alerts
    ...    View More
    [Teardown]    Run Keyword And Ignore Error    Fechar Aplicativo Android
