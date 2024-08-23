

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
   git clone https://github.com/yourusername/overnight-recon.git
   cd overnight-recon
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
   git clone https://github.com/yourusername/overnight-recon.git
   cd overnight-recon
   chmod +x ovrecon.sh
   ```

5. **Run the Script:**
   Execute the script with:

   ```
   ./ovrecon.sh
   ```
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

Feel free to include this section in your repository’s README or other documentation to clarify the educational intent of the tool and emphasize the importance of ethical and legal usage.
