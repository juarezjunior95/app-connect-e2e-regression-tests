#!/usr/bin/env bash
# Instala Zscaler Root CA no emulador Android (requer AVD com system writable).
# Uso: ./scripts/install-zscaler-ca-emulator.sh
# Antes: no Device Manager, edite o AVD → Show Advanced Settings → marque opção
#        equivalente a "Writable system image" (ou crie AVD com -writable-system).

set -euo pipefail
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CER="${REPO_ROOT}/Zscaler_Root_CA.cer"
ADB="${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools/adb"

if [[ ! -f "$CER" ]]; then
  echo "Certificado não encontrado: $CER"
  exit 1
fi
if [[ ! -x "$ADB" ]]; then
  echo "adb não encontrado. Defina ANDROID_HOME ou instale Android SDK platform-tools."
  exit 1
fi

echo "Dispositivos:"
"$ADB" devices -l

TMP=$(mktemp -d)
PEM="${TMP}/zscaler.pem"
openssl x509 -inform DER -in "$CER" -out "$PEM"
HASH=$(openssl x509 -inform PEM -subject_hash_old -in "$PEM" | head -1)
CERT_NAME="${HASH}.0"
cp "$PEM" "${TMP}/${CERT_NAME}"

echo "Instalando como CA de sistema: ${CERT_NAME}"
"$ADB" root
"$ADB" remount
"$ADB" push "${TMP}/${CERT_NAME}" "/system/etc/security/cacerts/${CERT_NAME}"
"$ADB" shell chmod 644 "/system/etc/security/cacerts/${CERT_NAME}"
rm -rf "$TMP"

echo "Reiniciando emulador..."
"$ADB" reboot
echo "Após reiniciar, teste o login novamente e confira Logcat (sem net_error -202)."
