# 📱 Automação Mobile - App Connect (Robot Framework)

Este repositório contém a automação de testes para o aplicativo nativo **App Connect**, utilizando **Robot Framework** e **Appium**. O projeto está estruturado para suportar testes tanto em Android quanto em iOS.

## 🏗️ Estrutura do Projeto

* **env/**: Arquivos de configuração de variáveis de ambiente (IP do Appium, IDs de dispositivos, caminhos dos APKs/IPAs).
* **resources/**:
    * `android/`: Keywords e Page Objects específicos para Android.
    * `ios/`: Keywords e Page Objects específicos para iOS.
* **tests/**: Casos de teste organizados por funcionalidade.
* **results/**: Relatórios e logs gerados após a execução.

---

## 🛠️ Requisitos e Ferramentas

Para rodar este projeto, você precisará configurar o ambiente mobile:

1.  **Node.js & Appium Server**: O motor que comunica o Robot com o celular.
2.  **Appium Inspector**: Para mapear os elementos (IDs, XPaths) do app.
3.  **Android Studio / Xcode**: Para emuladores e ferramentas de linha de comando (adb).
4.  **Python 3.x**.

### Instalação das Bibliotecas

```bash
pip install robotframework-appiumlibrary