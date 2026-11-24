# APK Android (build de testes)

Coloque aqui o ficheiro **`app-dev-debug.apk`** (ou outro nome e ajuste `${ANDROID_APP_LOCAL}` em `resources/android/android_variables.robot`).

## Nome do ficheiro

Recomendamos **`app-dev-debug.apk`** sem espaços nem parênteses, para evitar erros em shell, CI e caminhos.

## Onde o projeto aponta

Por defeito: `${EXECDIR}/apps/android/app-dev-debug.apk` (ver `resources/android/android_variables.robot`).

## BrowserStack

Para correr na nuvem não precisa do APK nesta máquina: faça upload no BrowserStack e use o ID `bs://…` na variável de ambiente `CLOUD_APP`. Passo a passo: `docs/browserstack.md`.
