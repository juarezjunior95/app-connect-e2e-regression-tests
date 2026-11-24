*** Variables ***
# APK local padrão: coloque o build em apps/android/ (ver apps/android/README.md)
${ANDROID_APP_LOCAL}       ${EXECDIR}/apps/android/app-dev-debug.apk

# Valores padrão de dispositivo (sobrescreva com -v ou variáveis de ambiente na keyword de sessão)
${PLATFORM_NAME}           Android
${PLATFORM_VERSION}        14.0
${DEVICE_NAME}             Google Pixel 8
${AUTOMATION_NAME}         UiAutomator2

# Credenciais: export TEST_USER_EMAIL / TEST_USER_PASSWORD ou robot -v (ver Carregar Credenciais De Teste)
${TEST_USER_EMAIL}         ${EMPTY}
${TEST_USER_PASSWORD}      ${EMPTY}
