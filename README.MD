# Automação mobile — App Connect (Robot Framework + Appium)

Automação de testes para o app nativo **App Connect**, com **Robot Framework**, **AppiumLibrary** e organização no padrão **Page Object** (um ficheiro `.robot` por ecrã / fluxo, com locators e keywords reutilizáveis).

## Estrutura

| Pasta / ficheiro | Função |
|------------------|--------|
| `apps/android/` | APK de debug local (`app-dev-debug.apk`) — ver `apps/android/README.md` |
| `docs/browserstack.md` | Passo a passo: conta, upload do APK, variáveis de ambiente, comando `robot` |
| `config/` | Nota de migração do APK (legado) |
| `resources/main_resources.robot` | Bibliotecas e imports globais |
| `resources/android/android_variables.robot` | Variáveis partilhadas (paths, device, credenciais vazias por defeito) |
| `resources/android/android_session.robot` | Abrir/fechar sessão Appium (local ou nuvem) |
| `resources/android/android_login_page.robot` | Page Object: login |
| `resources/android/android_home_page.robot` | Page Object: home e fluxos associados |
| `tests/android_tests/` | Casos de teste (apenas orquestração; sem locators) |
| `.env.example` | Modelo de variáveis (BrowserStack, credenciais de teste); copiar para `.env` |

Execute sempre a partir da **raiz do repositório** para `${EXECDIR}/apps/android/...` apontar para o APK certo.

## Requisitos

- Python 3.9+
- `pip install -r requirements.txt`
- Para **local**: [Appium](https://appium.io/) a correr (ex.: `http://127.0.0.1:4723/wd/hub`) e Android SDK / emulador ou dispositivo USB.

## Credenciais (obrigatório)

Não commite passwords. Antes de correr:

```bash
export TEST_USER_EMAIL="seu.email@empresa.com"
export TEST_USER_PASSWORD="sua_senha"
```

Ou na linha de comando:

```bash
robot -v TEST_USER_EMAIL:user@dominio -v TEST_USER_PASSWORD:secret …
```

A keyword `Carregar Credenciais De Teste` (Suite Setup) valida que email e password estão definidos.

### Ficheiro `.env` (opcional)

1. Copia o modelo: `cp .env.example .env`
2. Edita `.env` com username/key BrowserStack, `CLOUD_APP`, email/password de teste, etc.
3. **O Robot não lê `.env` sozinho** — no terminal, na raiz do repo: `source .env` e só depois `robot …`
4. `.env` está no `.gitignore`; o que pode ir para o Git é só **`.env.example`** (sem segredos reais).

## Correr testes

```bash
cd /Users/jfranccr/Documents/app-connect-e2e-regression-tests
robot -d results -v TEST_USER_EMAIL:… -v TEST_USER_PASSWORD:… tests/android_tests/android_login_tests.robot
robot -d results -v TEST_USER_EMAIL:… -v TEST_USER_PASSWORD:… tests/android_tests/android_home_tests.robot
```

## Nuvem: BrowserStack vs LambdaTest

Ambos expõem um **hub Appium remoto**; o código é o mesmo: muda a URL (`REMOTE_APPIUM_URL`), o identificador da app (`CLOUD_APP`) e, em geral, `DEVICE_NAME` / `PLATFORM_VERSION` para o dispositivo escolhido no painel.

| Critério | BrowserStack | LambdaTest |
|----------|----------------|------------|
| Ecossistema / docs Appium | Muito maduro | Muito bom |
| Preço | Típico enterprise | Por vezes mais competitivo |
| Integração CI | Forte | Forte |

Recomendação pragmática: **use o que a vossa org já tiver licenciado**; se estiverem a escolher do zero, comparem preço para o vosso volume de minutos paralelos e requisitos de dispositivos (versões Android, modelos reais vs virtual).

### BrowserStack

Guia completo (upload, `REMOTE_APPIUM_URL`, `CLOUD_APP`, dispositivos): **[`docs/browserstack.md`](docs/browserstack.md)**.

Resumo rápido:

1. Façam upload do APK (UI ou [REST API](https://www.browserstack.com/docs/app-automate/api-reference)).
2. Copiem o `bs://…` devolvido.
3. Exportem:

```bash
export BROWSERSTACK_USERNAME="…"
export BROWSERSTACK_ACCESS_KEY="…"
export REMOTE_APPIUM_URL="https://SEU_USER:SEU_KEY@hub-cloud.browserstack.com/wd/hub"
export CLOUD_APP="bs://…"
export DEVICE_NAME="Samsung Galaxy S24"   # exemplo; alinhar com o vosso plano
export PLATFORM_VERSION="14.0"
```

4. Corram o `robot` como acima (com credenciais de teste).

### LambdaTest

1. Upload do `.apk` no dashboard ou API; obtenham `lt://…` (ou URL indicada na documentação atual).
2. Exportem:

```bash
export LT_USERNAME="…"
export LT_ACCESS_KEY="…"
export REMOTE_APPIUM_URL="https://SEU_USER:SEU_KEY@mobile-hub.lambdatest.com/wd/hub"
export CLOUD_APP="lt://…"
export DEVICE_NAME="Galaxy S23"          # exemplo
export PLATFORM_VERSION="14"
```

Alguns planos pedem capabilities extra (`isRealMobile`, nome de build, etc.); podem acrescentá-las mais tarde com um wrapper em `android_session.robot` se necessário.

## O que foi corrigido / melhorado neste repo

- **Page Objects**: `main_resources` importa variáveis, sessão e páginas por ordem clara.
- **Sessão única**: `Abrir Aplicativo Android` lê `REMOTE_APPIUM_URL`, `CLOUD_APP` e fallbacks de `DEVICE_NAME` / `PLATFORM_VERSION` via ambiente.
- **Bug de login**: o campo password recebia o email; passa a usar `${password}`.
- **Argumentos dos testes**: chamadas corretas a `Acessar app connect android` (posicionais), e nomes de variáveis Robot válidos (sem `-` / `&` nos identificadores de argumento).
- **Swipe + loops**: `FOR` + `Exit For Loop If` e `Swipe` com argumentos **nomeados** (exigência da AppiumLibrary).
- **Segurança**: removidas credenciais em texto claro dos `.robot`; uso de env / `-v`.
- **APK local**: `${EXECDIR}/apps/android/app-dev-debug.apk` (ajustável em `resources/android/android_variables.robot`).

## Appium Inspector

Continua a ser a ferramenta indicada para rever `xpath` / `resource-id` quando o Ionic/WebView mudar.
