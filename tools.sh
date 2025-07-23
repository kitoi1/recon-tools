#!/bin/bash
# Cloud Hacking Tools Auto-Installer (Fixed Version)

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}[+] Cloud Hacking Tools Auto-Installer${NC}"

# Create tools directory
mkdir -p ~/tools && cd ~/tools

# Install Go if missing (required for many cloud tools)
if ! command -v go &> /dev/null; then
    echo -e "${YELLOW}[+] Installing Go...${NC}"
    # Use the latest stable Go version
    GO_VERSION="1.22.5"
    wget "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz"
    
    if [ -f "go${GO_VERSION}.linux-amd64.tar.gz" ]; then
        sudo rm -rf /usr/local/go  # Remove any existing Go installation
        sudo tar -C /usr/local -xzf "go${GO_VERSION}.linux-amd64.tar.gz"
        
        # Add Go to PATH
        export PATH=$PATH:/usr/local/go/bin
        echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
        
        # Clean up
        rm "go${GO_VERSION}.linux-amd64.tar.gz"
        echo -e "${GREEN}[✓] Go installed successfully${NC}"
    else
        echo -e "${RED}[!] Failed to download Go. Please check your internet connection.${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}[✓] Go already installed${NC}"
fi

# Update PATH for Go binaries
export PATH=$PATH:$(go env GOPATH)/bin
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc

echo -e "${YELLOW}[+] Installing cloud hacking tools...${NC}"

# Function to install Go tools with error handling
install_go_tool() {
    local tool_url=$1
    local tool_name=$2
    
    echo -e "${YELLOW}  Installing ${tool_name}...${NC}"
    if go install "${tool_url}@latest"; then
        echo -e "${GREEN}  ✓ ${tool_name} installed${NC}"
    else
        echo -e "${RED}  ✗ Failed to install ${tool_name}${NC}"
    fi
}

# Cloud-specific recon tools
install_go_tool "github.com/projectdiscovery/subfinder/v2/cmd/subfinder" "Subfinder"
install_go_tool "github.com/projectdiscovery/cloudlist/cmd/cloudlist" "Cloudlist"

# Cloud bruteforce/enumeration
install_go_tool "github.com/projectdiscovery/naabu/v2/cmd/naabu" "Naabu"
install_go_tool "github.com/projectdiscovery/httpx/cmd/httpx" "Httpx"

# Cloud bucket tools
install_go_tool "github.com/tomnomnom/anew" "Anew"
install_go_tool "github.com/sa7mon/s3scanner" "S3Scanner"

# Cloud metadata and SSRF tools
install_go_tool "github.com/projectdiscovery/cloudflair/cmd/cloudflair" "Cloudflair"

# Infrastructure analysis
install_go_tool "github.com/projectdiscovery/nuclei/v2/cmd/nuclei" "Nuclei"
install_go_tool "github.com/projectdiscovery/katana/cmd/katana" "Katana"

# Additional useful cloud tools
install_go_tool "github.com/projectdiscovery/dnsx/cmd/dnsx" "DNSx"
install_go_tool "github.com/projectdiscovery/tlsx/cmd/tlsx" "TLSx"

echo -e "${YELLOW}[+] Installing non-Go cloud tools...${NC}"

# CloudBrute (multi-cloud enumeration) - Alternative approach
echo -e "${YELLOW}  Installing CloudBrute...${NC}"
if git clone https://github.com/0xsha/CloudBrute.git; then
    cd CloudBrute
    if go build -o CloudBrute main.go; then
        sudo mv CloudBrute /usr/local/bin/
        echo -e "${GREEN}  ✓ CloudBrute installed${NC}"
    else
        echo -e "${RED}  ✗ Failed to build CloudBrute${NC}"
    fi
    cd ..
    rm -rf CloudBrute
else
    echo -e "${RED}  ✗ Failed to clone CloudBrute${NC}"
fi

# Pacu (AWS exploitation framework)
echo -e "${YELLOW}  Installing Pacu...${NC}"
if git clone https://github.com/RhinoSecurityLabs/pacu.git; then
    cd pacu
    # Install Python dependencies
    if command -v pip3 &> /dev/null; then
        pip3 install -r requirements.txt
        echo -e "${GREEN}  ✓ Pacu installed (use: cd pacu && python3 pacu.py)${NC}"
    else
        echo -e "${YELLOW}  ⚠ pip3 not found. Install Python3-pip to complete Pacu setup${NC}"
    fi
    cd ..
else
    echo -e "${RED}  ✗ Failed to clone Pacu${NC}"
fi

# Cloud_enum (Python tool for cloud enumeration)
echo -e "${YELLOW}  Installing cloud_enum...${NC}"
if git clone https://github.com/initstring/cloud_enum.git; then
    cd cloud_enum
    if command -v pip3 &> /dev/null; then
        pip3 install -r requirements.txt
        chmod +x cloud_enum.py
        sudo ln -sf $(pwd)/cloud_enum.py /usr/local/bin/cloud_enum
        echo -e "${GREEN}  ✓ cloud_enum installed${NC}"
    else
        chmod +x cloud_enum.py
        echo -e "${YELLOW}  ⚠ cloud_enum downloaded but pip3 not found for dependencies${NC}"
    fi
    cd ..
else
    echo -e "${RED}  ✗ Failed to clone cloud_enum${NC}"
fi

# Install AWS CLI if not present
if ! command -v aws &> /dev/null; then
    echo -e "${YELLOW}  Installing AWS CLI...${NC}"
    if command -v pip3 &> /dev/null; then
        pip3 install awscli
        echo -e "${GREEN}  ✓ AWS CLI installed${NC}"
    else
        echo -e "${YELLOW}  ⚠ pip3 not found. Install manually for AWS CLI${NC}"
    fi
fi

# Update nuclei templates
echo -e "${YELLOW}[+] Updating Nuclei templates...${NC}"
if command -v nuclei &> /dev/null; then
    nuclei -update-templates
    echo -e "${GREEN}[✓] Nuclei templates updated${NC}"
fi

echo
echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}[✓] Installation Complete!${NC}"
echo -e "${GREEN}================================${NC}"
echo
echo -e "${YELLOW}Tools installed:${NC}"
echo "  → Go-based tools in: $(go env GOPATH)/bin"
echo "  → System tools in: /usr/local/bin"
echo "  → Python tools in: ~/tools/"
echo
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Reload your shell: source ~/.bashrc"
echo "  2. Configure cloud credentials:"
echo "     • AWS: aws configure"
echo "     • Azure: az login"
echo "     • GCP: gcloud auth login"
echo
echo -e "${YELLOW}Usage examples:${NC}"
echo "  • subfinder -d example.com"
echo "  • nuclei -u https://example.com"
echo "  • cloudlist -provider aws"
echo "  • s3scanner -bucket example-bucket"
echo
echo -e "${RED}⚠  Security Notice:${NC}"
echo "Only use these tools on systems you own or have explicit permission to test!"
