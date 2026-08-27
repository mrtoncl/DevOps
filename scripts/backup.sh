set -e

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="./Backend/Database_backup"
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.sql"

mkdir -p "$BACKUP_DIR"

echo "Yedek alınıyor: $BACKUP_FILE"
docker exec -t $(docker compose ps -q postgres) pg_dump -U postgres -d postgres > "$BACKUP_FILE"

echo "Yedek tamamlandı: $BACKUP_FILE"
