*** Settings ***

Resource             main_resources.robot


*** Test Cases ***


MARTGNM-T375- Validar login com credencias validas 
    [Tags]     login_test
    Abrir Aplicativo Android Local
    Acessar app connect android        
    ...        EMAIL=juares.junior-ext@ab-inbev.com
    ...        PASSWORD=QA@12345  
    ...        EXPECTED_MESSAGE=Welcome
    Validar que seguintes abas estao sendo exibidas na tela home
    ...    PAGE_HOME=Home
    ...    PAGE_SOCIAL-RADAR=Social Radar
    ...    PAGE_INFLUENCERS=Influencers
    ...    PAGE_ALERTS=Alerts
    ...    PAGE_VIEW-MORE=View More
    






    