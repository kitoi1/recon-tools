#!/bin/bash
# Cloud Hacking Tools Auto-Installer

# Create tools directory
mkdir -p ~/tools && cd ~/tools

# Install Go if missing (required for many cloud tools)
if ! command -v go &> /dev/null; then
    echo "[+] Installing Go..."
    wget https://go.dev/dl/go1.21.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.21.linux-amd64.tar.gz
    export PATH=$PATH:/usr/local/go/bin
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
fi

# Update PATH for Go binaries
export PATH=$PATH:$(go env GOPATH)/bin
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc

echo "[+] Installing cloud hacking tools..."

# Cloud-specific recon tools
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/cloudlist/cmd/cloudlist@latest
go install github.com/aws/aws-sdk-go/aws@latest  # AWS SDK for custom tooling

# Cloud bruteforce/enumeration
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest

# Cloud bucket tools
go install github.com/tomnomnom/anew@latest
go install github.com/sa7mon/s3scanner@latest

# Cloud metadata and SSRF tools
go install github.com/ethicalhackingplayground/cloudflair@latest
go install github.com/initstring/cloud_enum@latest

# Infrastructure analysis
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/projectdiscovery/katana/cmd/katana@latest

# Install specific cloud tools from GitHub
echo "[+] Installing non-Go cloud tools..."

# CloudBrute (multi-cloud enumeration)
wget https://github.com/0xsha/CloudBrute/releases/latest/download/CloudBrute_linux_amd64.tar.gz
tar -xzf CloudBrute_linux_amd64.tar.gz && chmod +x CloudBrute && sudo mv CloudBrute /usr/local/bin/

# Pacu (AWS exploitation framework)
git clone https://github.com/RhinoSecurityLabs/pacu.git
cd pacu && bash install.sh && cd ..

# Done
echo "[✓] Cloud hacking tools installed!"
echo "✅ Tools installed to ~/go/bin and /usr/local/bin"
echo "⚠️  Remember to configure your cloud credentials before use!"
