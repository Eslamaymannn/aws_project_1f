# automated Web Infrastructure & Backup System
Project Overview
This project demonstrates a practical integration between AWS Cloud Infrastructure, Linux System Administration, and Bash Scripting. It features a live Web Server hosted on AWS EC2, managed via Linux, with a fully automated backup system that archives web content and uploads it to an AWS S3 bucket for disaster recovery.

🚀 Key Features
Cloud Hosting: Deployed a Linux-based Virtual Machine using AWS EC2.

Web Services: Configured and managed an Apache2 web server.

Security: Implemented IAM Roles for secure service-to-service communication (EC2 to S3) without hardcoding credentials.

Automation: Developed a Bash Script to handle routine maintenance, including file compression and cloud synchronization.

Scheduling: Leveraged Cron Jobs for hands-free, periodic backups.

🛠 Tech Stack
Cloud Provider: AWS (EC2, S3, IAM)

Operating System: Ubuntu 24.04 LTS

Scripting Language: Bash

Tools: Git, AWS CLI, Apache2, Crontab

📂 Project Structure
automate_backup.sh: The core Bash script that performs the backup and S3 upload.

/var/www/html: Source directory for the web content.

README.md: Project documentation.

🔧 Implementation Details
1. AWS Configuration
Launched an EC2 instance with a customized Security Group (Ports 22 & 80).

Created an S3 Bucket for long-term storage.

Attached an IAM Policy to the EC2 instance to allow s3:PutObject permissions.

2. Bash Script Workflow
The automate_backup.sh script follows these logical steps:

Initialization: Defines variables for paths and timestamps.

Compression: Packages the web directory into a .tar.gz archive.

Cloud Sync: Uses aws s3 cp to move the archive to the cloud.

Verification: Checks the exit status of the command to ensure success.

Cleanup: Deletes local temporary files to optimize disk space.
3. Automation (Crontab)
To ensure data persistence, the script is scheduled to run automatically:

Bash
# Example: Runs daily at 3:00 AM
0 3 * * * /home/ubuntu/automate_backup.sh

3. Automation (Crontab)
To ensure data persistence, the script is scheduled to run automatically:
