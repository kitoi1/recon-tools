#!/bin/bash
# Enhanced Recon Tools Auto-Installer v2.0
# This script installs essential recon tools and ensures a clean and efficient installation process.

# Set up the tools directory
TOOLS_DIR=~/tools
mkdir -p $TOOLS_DIR && cd $TOOLS_DIR

# Check for Go installation
if ! command -v go &> /dev/null; then
    echo "[!] Go is not installed on your system."
    echo "[!] Please install Go first from https://golang.org/dl/ and ensure it is in your PATH."
    exit 1
fi

# Add ~/go/bin to PATH if not already included
if ! echo "$PATH" | grep -q "$HOME/go/bin"; then
    echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
    echo "[+] Added ~/go/bin to PATH. Please run 'source ~/.bashrc' or open a new terminal session."
fi

echo "[+] Installing recon tools..."

# Function to check if a tool is already installed
install_go_tool() {
    TOOL=$1
    if ! command -v $(basename $TOOL) &> /dev/null; then
        echo "[+] Installing $(basename $TOOL)..."
        go install $TOOL@latest
    else
        echo "[✓] $(basename $TOOL) is already installed. Skipping."
    fi
}

# Install Go-based tools
install_go_tool github.com/projectdiscovery/subfinder/v2/cmd/subfinder
install_go_tool github.com/tomnomnom/assetfinder
install_go_tool github.com/lc/gau/v2/cmd/gau
install_go_tool github.com/projectdiscovery/httpx/cmd/httpx
install_go_tool github.com/projectdiscovery/dnsx/cmd/dnsx
install_go_tool github.com/projectdiscovery/nuclei/v2/cmd/nuclei

# Install Amass
if ! command -v amass &> /dev/null; then
    echo "[+] Installing Amass..."
    wget -q https://github.com/owasp-amass/amass/releases/latest/download/amass_linux_amd64.zip
    unzip -q amass_linux_amd64.zip && sudo mv amass_linux_amd64/amass /usr/local/bin/
    rm -rf amass_linux_amd64*
else
    echo "[✓] Amass is already installed. Skipping."
fi

# Install Findomain
if ! command -v findomain &> /dev/null; then
    echo "[+] Installing Findomain..."
    wget -q https://github.com/findomain/findomain/releases/latest/download/findomain-linux -O findomain
    chmod +x findomain && sudo mv findomain /usr/local/bin/
else
    echo "[✓] Findomain is already installed. Skipping."
fi

# Install Aquatone
if ! command -v aquatone &> /dev/null; then
    echo "[+] Installing Aquatone..."
    wget -q https://github.com/michenriksen/aquatone/releases/latest/download/aquatone_linux_amd64_1.7.0.zip
    unzip -q aquatone_linux_amd64_1.7.0.zip && chmod +x aquatone && sudo mv aquatone /usr/local/bin/
    rm -f aquatone_linux_amd64_1.7.0.zip
else
    echo "[✓] Aquatone is already installed. Skipping."
fi

# Cleanup unused files
echo "[+] Cleaning up temporary files..."
rm -f *.zip

# Completion message
echo "[✓] All tools successfully installed!"
echo "✅ Ensure that ~/go/bin is in your PATH for Go-based tools to work properly."
