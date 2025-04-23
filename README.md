# Recon Tools Auto-Installer

This script automates the installation of essential reconnaissance tools for security assessments. It ensures a seamless setup of various tools used in subdomain enumeration, vulnerability scanning, HTTP probing, and more.

## Features
- **Automated Installation**: Installs all the necessary recon tools with minimal user intervention.
- **Tool Validation**: Checks if Go is installed and ensures `~/go/bin` is in your system's PATH.
- **Efficient Management**: Skips installation for already-installed tools to save time.
- **Clean Installation**: Downloads and sets up tools from their official repositories, and removes temporary files after installation.

## Tools Installed
1. **[Subfinder](https://github.com/projectdiscovery/subfinder)** - Subdomain enumeration.
2. **[Assetfinder](https://github.com/tomnomnom/assetfinder)** - Discover related domains and subdomains.
3. **[gau](https://github.com/lc/gau)** - Fetch URLs from the Wayback Machine and other sources.
4. **[Httpx](https://github.com/projectdiscovery/httpx)** - Probing HTTP services.
5. **[Dnsx](https://github.com/projectdiscovery/dnsx)** - DNS resolution and enumeration.
6. **[Nuclei](https://github.com/projectdiscovery/nuclei)** - Vulnerability scanning.
7. **[Amass](https://github.com/owasp-amass/amass)** - In-depth subdomain enumeration.
8. **[Findomain](https://github.com/findomain/findomain)** - Fast subdomain enumeration.
9. **[Aquatone](https://github.com/michenriksen/aquatone)** - Visual reconnaissance via screenshots.

## Prerequisites
- **Go**: Ensure Go is installed. Download it from [https://golang.org/dl/](https://golang.org/dl/).
- **Dependencies**: The script uses `wget`, `unzip`, and `sudo`. Make sure these are installed on your system.

## Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/kitoi1/recon-tools.git
   cd recon-tools
   ```

2. Make the script executable:
   ```bash
   chmod +x install_recon_tools.sh
   ```

3. Run the script:
   ```bash
   ./install_recon_tools.sh
   ```

4. If `~/go/bin` was added to your PATH, reload your shell configuration:
   ```bash
   source ~/.bashrc
   ```

## Output
Once the script completes, all tools will be installed and ready for use. Ensure that `~/go/bin` is in your PATH for Go-based tools to function correctly.

## Notes
- The script is designed to keep your system clean by removing temporary files after installation.
- If a tool is already installed, it will be skipped during execution.

## Contribution
Feel free to contribute to this repository by submitting issues or pull requests to enhance functionality or add support for additional tools.

---

Happy Reconnaissance!
