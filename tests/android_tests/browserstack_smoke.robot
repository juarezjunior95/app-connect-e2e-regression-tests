*** Settings ***
Documentation     Smoke: valida hub BrowserStack + capability app (abre e fecha sessão).
Resource          ../../resources/main_resources.robot


*** Test Cases ***
Smoke BrowserStack Conexao
    [Documentation]    Requer .env com REMOTE_APPIUM_URL, CLOUD_APP, DEVICE_NAME, PLATFORM_NAME/VERSION.
    [Tags]    smoke    browserstack
    Abrir Aplicativo Android
    Sleep    5s
    [Teardown]    Run Keyword And Ignore Error    Fechar Aplicativo Android
