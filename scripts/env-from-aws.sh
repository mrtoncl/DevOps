#!/usr/bin/env bash
# MRO-Pulse konfigurasyonunu AWS'ten cekip .env dosyasi uretir.
# EC2 uzerinde, instance'a bagli IAM rolu ile calisir.
set -euo pipefail

REGION="eu-central-1"
SECRET_ID="mro-pulse/db-connection-string"
PARAM_PATH="/mro-pulse"

REPO_KOK="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_DOSYASI="$REPO_KOK/.env"

echo "AWS'ten konfigurasyon cekiliyor (region: $REGION)..."

DB_CONNECTION_STRING="$(aws secretsmanager get-secret-value \
  --secret-id "$SECRET_ID" --region "$REGION" \
  --query SecretString --output text)"

parametre_al() {
  aws ssm get-parameter --name "$PARAM_PATH/$1" --region "$REGION" \
    --query 'Parameter.Value' --output text
}

POSTGRES_DB="$(parametre_al POSTGRES_DB)"
POSTGRES_USER="$(parametre_al POSTGRES_USER)"
FASTAPI_URL="$(parametre_al FASTAPI_URL)"
ALLOWED_ORIGINS="$(parametre_al ALLOWED_ORIGINS)"

umask 077
cat > "$ENV_DOSYASI" <<EOF
POSTGRES_DB=$POSTGRES_DB
POSTGRES_USER=$POSTGRES_USER
DB_CONNECTION_STRING=$DB_CONNECTION_STRING
FASTAPI_URL=$FASTAPI_URL
ALLOWED_ORIGINS=$ALLOWED_ORIGINS
EOF

chmod 600 "$ENV_DOSYASI"
echo ".env olusturuldu: $ENV_DOSYASI"