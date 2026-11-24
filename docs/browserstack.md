# Configurar BrowserStack com este projeto

Este repositório usa **Robot Framework + AppiumLibrary**. A sessão é criada em `resources/android/android_session.robot` com a keyword **`Abrir Aplicativo Android`**, que lê variáveis de ambiente.

## 1. Conta e credenciais

1. Aceda a [BrowserStack](https://www.browserstack.com/) e inicie sessão (ou crie conta de teste).
2. No dashboard, vá a **Account** → **Settings** e copie:
   - **Username**
   - **Access Key**

Guarde-os como variáveis de ambiente (não commite em repositório):

```bash
export BROWSERSTACK_USERNAME="o_seu_username"
export BROWSERSTACK_ACCESS_KEY="a_sua_access_key"
```

## 2. Upload do APK

Precisa do identificador **`bs://…`** para a capability `app`.

### Opção A — Interface web

1. **App Live** ou **App Automate** → **Upload** (conforme o produto que usem para App Automate).
2. Depois do upload, copie o URL/ID da app (formato `bs://xxxxxxxx`).

### Opção B — API (útil em CI)

Consulte a documentação oficial: [Upload app via REST API](https://www.browserstack.com/docs/app-automate/api-reference).

Exemplo genérico (substitua o caminho do APK e as credenciais):

```bash
curl -u "SEU_USERNAME:SEU_ACCESS_KEY" \
  -X POST "https://api-cloud.browserstack.com/app-automate/upload" \
  -F "file=@apps/android/app-dev-debug.apk"
```

A resposta JSON inclui algo como `"app_url": "bs://…"`. Use esse valor em `CLOUD_APP`.

## 3. URL do hub Appium

O endpoint do App Automate (Android) é:

```text
https://SEU_USERNAME:SEU_ACCESS_KEY@hub-cloud.browserstack.com/wd/hub
```

No terminal:

```bash
export REMOTE_APPIUM_URL="https://${BROWSERSTACK_USERNAME}:${BROWSERSTACK_ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub"
export CLOUD_APP="bs://cole_aqui_o_id_retornado_no_upload"
```

## 4. Dispositivo e versão Android

Escolha um dispositivo compatível com o vosso plano e alinhe com a [lista de dispositivos BrowserStack](https://www.browserstack.com/list-of-browsers-and-platforms/app_automate).

Exemplo:

```bash
export DEVICE_NAME="Samsung Galaxy S24"
export PLATFORM_VERSION="14.0"
```

Estes nomes devem corresponder ao que o BrowserStack espera para App Automate (strings exatas do painel / documentação).

## 5. Credenciais da aplicação (testes)

Os testes de login precisam de utilizador e password de teste:

```bash
export TEST_USER_EMAIL="utilizador@empresa.com"
export TEST_USER_PASSWORD="password_de_teste"
```

## 6. Executar os testes

Na **raiz do repositório**:

```bash
cd /caminho/para/app-connect-e2e-regression-tests

robot -d results \
  tests/android_tests/android_login_tests.robot
```

(Repita ou inclua `android_home_tests.robot` conforme necessário.)

## 7. Resumo das variáveis usadas pelo código

| Variável | Obrigatório na nuvem | Descrição |
|----------|----------------------|-----------|
| `REMOTE_APPIUM_URL` | Sim | URL do hub com `username:access_key` |
| `CLOUD_APP` | Sim | `bs://…` após upload |
| `DEVICE_NAME` | Recomendado | Modelo (ex.: Samsung Galaxy S24) |
| `PLATFORM_VERSION` | Recomendado | Versão Android (ex.: 14.0) |
| `TEST_USER_EMAIL` / `TEST_USER_PASSWORD` | Sim (para suites de login) | Credenciais de teste da app |

Se **`CLOUD_APP`** estiver vazio, o projeto tenta usar o APK local em `apps/android/app-dev-debug.apk` (útil para Appium local).

## 8. Capabilities extra (opcional)

BrowserStack suporta opções como nome de build, nome de sessão ou `project` via `bstack:options` ou capabilities legacy. Se precisarem (relatórios no dashboard, tagging), podemos estender `android_session.robot` para passar um dicionário W3C — abram um pedido ou issue interna.

## Referência oficial

- [App Automate — Robot Framework](https://www.browserstack.com/docs/app-automate/getting-started/robot-framework/integrate-your-tests)
- [Desired capabilities — App Automate](https://www.browserstack.com/docs/app-automate/capabilities)
