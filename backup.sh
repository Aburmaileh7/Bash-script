#! /bin/bash

#variable

SOURCE_DIR="/root/backup"
LOG_FILE="backup.log"
REMOTE_HOST="root@10.123.40.92"
REMOTE_DIR="/root/"

#Function to perform the backup

perform_backup()
{
  rsync -avz "$SOURCE_DIR" "$REMOTE_HOST":"$REMOTE_DIR" > "$LOG_FILE" 2>&1
  if [ $? -eq 0 ]
  then
          echo "Backup Successful $(date)" >> "$LOG_FILE"
  else
          echo "Backup failed $(date) " >> "$LOG_FILE"
  fi

}

#Run the backup

perform_backup


