#!/bin/bash
# Recon Tools Auto-Installer

mkdir -p ~/tools && cd ~/tools

# Install Go if missing
if ! command -v go &> /dev/null; then
    echo "[!] Go not found. Please install Go first from https://golang.org/dl/"
    exit 1
fi

echo "[+] Installing recon tools..."

go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

# Amass (install from GitHub binary)
wget https://github.com/owasp-amass/amass/releases/latest/download/amass_linux_amd64.zip
unzip amass_linux_amd64.zip && sudo mv amass_linux_amd64/amass /usr/local/bin/

# Findomain
wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux -O findomain
chmod +x findomain && sudo mv findomain /usr/local/bin/

# Aquatone
wget https://github.com/michenriksen/aquatone/releases/latest/download/aquatone_linux_amd64_1.7.0.zip
unzip aquatone_linux_amd64_1.7.0.zip && chmod +x aquatone && sudo mv aquatone /usr/local/bin/

# Done
echo "[✓] All tools installed!"
echo "✅ Be sure ~/go/bin is in your PATH"
