*** Settings ***
Documentation       Abertura de sessão Appium: local, BrowserStack ou LambdaTest.
...                 Exporte REMOTE_APPIUM_URL e CLOUD_APP para nuvem (ver README).
Resource            android_variables.robot
Library             AppiumLibrary
Library             OperatingSystem
Library             String


*** Keywords ***
Abrir Aplicativo Android
    [Documentation]    REMOTE_APPIUM_URL (opcional), CLOUD_APP (opcional, ex. bs:// ou lt://).
    ...                Sem CLOUD_APP, usa o APK em ANDROID_APP_LOCAL.
    ${remote}    Get Environment Variable    REMOTE_APPIUM_URL    http://127.0.0.1:4723/wd/hub
    ${cloud_app}    Get Environment Variable    CLOUD_APP    ${EMPTY}
    ${app}    Obter Capability App    ${cloud_app}
    ${platform_version}    Get Env Or Default    PLATFORM_VERSION    ${PLATFORM_VERSION}
    ${device_name}    Get Env Or Default    DEVICE_NAME    ${DEVICE_NAME}
    ${platform_name}    Get Env Or Default    PLATFORM_NAME    ${PLATFORM_NAME}
    Open Application    ${remote}
    ...    platformName=${platform_name}
    ...    platformVersion=${platform_version}
    ...    deviceName=${device_name}
    ...    automationName=${AUTOMATION_NAME}
    ...    app=${app}

Fechar Aplicativo Android
    Close Application

Get Env Or Default
    [Arguments]    ${env_name}    ${default_value}
    ${from_env}    Get Environment Variable    ${env_name}    ${EMPTY}
    ${use_env}    Evaluate    len("""${from_env}""") > 0
    IF    ${use_env}
        RETURN    ${from_env}
    END
    RETURN    ${default_value}

Obter Capability App
    [Arguments]    ${cloud_app}
    ${cloud}    Strip String    ${cloud_app}
    ${use_cloud}    Evaluate    len("""${cloud}""") > 0
    IF    ${use_cloud}
        RETURN    ${cloud}
    END
    File Should Exist    ${ANDROID_APP_LOCAL}
    ...    msg=APK não encontrado em ${ANDROID_APP_LOCAL}. Envie o build à nuvem e defina CLOUD_APP (bs:// / lt://) ou ajuste ANDROID_APP_LOCAL.
    RETURN    ${ANDROID_APP_LOCAL}

Carregar Credenciais De Teste
    [Documentation]    Prioridade: variáveis de ambiente TEST_USER_*; senão usa -v TEST_USER_EMAIL / TEST_USER_PASSWORD.
    ${from_env_e}    Get Environment Variable    TEST_USER_EMAIL    ${EMPTY}
    ${email}    Set Variable If    '${from_env_e}' != '${EMPTY}'    ${from_env_e}    ${TEST_USER_EMAIL}
    ${from_env_p}    Get Environment Variable    TEST_USER_PASSWORD    ${EMPTY}
    ${password}    Set Variable If    '${from_env_p}' != '${EMPTY}'    ${from_env_p}    ${TEST_USER_PASSWORD}
    Should Not Be Empty    ${email}    msg=Defina TEST_USER_EMAIL (export ou robot -v TEST_USER_EMAIL:user@dominio).
    Should Not Be Empty    ${password}    msg=Defina TEST_USER_PASSWORD (export ou robot -v TEST_USER_PASSWORD:...).
    Set Suite Variable    ${TEST_USER_EMAIL}    ${email}
    Set Suite Variable    ${TEST_USER_PASSWORD}    ${password}
