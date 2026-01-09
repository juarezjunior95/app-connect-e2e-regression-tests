*** Settings ***

Resource             main_resources.robot
Test Tags            home_tests
Test Setup          Abrir Aplicativo Android Local
*** Test Cases ***

MARTGNM-T379 Validar "GO TO APPROVALS" tela home
     [tags]    home_tests
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
    Clicar no botao GO TO APPROVALS
    Entao devo ser direcionado para tela de aprovaçao de Influencers     TITULO_ESPERADO_PAGINA=Influencer Activity

MARTGNM-T440 Validar que ao clicar na aba "Alerts" na pagina home seja direcionado para tela "alerts"
    [tags]    home_tests
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
    Clicar no Icone "Alerts"
    Entao a pagina Alerts contem as seguintes seções
    ...  Brand Alerts
    ...  Global News
    

MARTGNM-T441 Validar seção Tools "Social Radar"
     [tags]    home_tests
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
    Clicar no Icone "Social Radar"
    Ir para aba Dashboards
    Swipe até o elemento esta visivel        ${FOLLOW_PASSION_POINTS}
    Entao o titulo da pagina é exibido...
    ...    TITULO_ESPERADO_PAGINA=Social Radar

MARTGNM-T442 Validar seção View All Alerts
    [tags]    home_tests
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
   # Swipe Until Element Is Visible With Offset   ${ICONE_VIEW-ALL-ALERTS}    
    Ir para view All Alerts
    Entao a pagina Alerts contem as seguintes seções
    ...  Brand Alerts
    ...  Global News
MARTGNM-T378 Validar logout do app
    [tags]    home_tests
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
    Ir para fazer Logout
    Entao devo ser redirecionado para tela de login
    ...     TITULO_ESPERADO_PAGINA=Please log in with your ABI credentials

MARTGNM-T384 Validar seção education no canto inferior da tela
    [tags]    home_tests
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
    Ir para tela de Education
    Entao deve ser exibida as seguintes abas..
    ...    Policies & Process
    ...    Social Radar
    ...    Influencers
    ...    Alerts
    Swipe até o elemento esta visivel        ${TEXTO_EDUCATION}
