#!/bin/bash

BACKUP_DIR="/home/student/backups"
WEB_DIR="/var/www/html"

DB_NAME="labdb"
DB_USER="labuser"
DB_PASS="123456"

DATE=$(date +%Y-%m-%d_%H-%M-%S)

mkdir -p $BACKUP_DIR

echo "Backup web..."

tar -czf $BACKUP_DIR/web_$DATE.tar.gz $WEB_DIR

echo "Backup database..."

mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/db_$DATE.sql

echo "Delete old backup..."

find $BACKUP_DIR -type f -mtime +7 -delete

echo "Done"
