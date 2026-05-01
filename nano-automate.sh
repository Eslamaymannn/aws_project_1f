#!/bin/bash
# Website Backup Script # Compress website files and upload to AWS S3#


#varibals

SOURCE_FOLDER=/var/www/html

BACKUP_NAME="backup-$(date +%Y-%m-%d).tar.gz" 

S3_PATH="s3://eslam-bucket-frist "

# Create compressed backup archive

tar -czf /tmp/$BACKUP_NAME $SOURCE_FOLDER

# Upload backup file to AWS S3
#
aws s3 cp /tmp/$BACKUP_NAME $S3_PATH

if [ $? -eq 0 ]
then 
	echo "the backup is succesfully"
else 
	echo "the backup is failed"
fi
  

rm /tmp/$BACKUP_NAME
