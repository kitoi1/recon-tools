# Cloud Hacking Tools Auto-Installer

🔧 Automated installer for essential cloud penetration testing and reconnaissance tools.

## 🚀 Quick Start

```bash
git clone https://github.com/yourusername/cloud-hacking-tools.git
cd cloud-hacking-tools
chmod +x tools.sh
./tools.sh
```

## 📋 What Gets Installed

### Go-based Tools
- **[Subfinder](https://github.com/projectdiscovery/subfinder)** - Subdomain discovery tool
- **[Cloudlist](https://github.com/projectdiscovery/cloudlist)** - Multi-cloud asset enumeration
- **[Naabu](https://github.com/projectdiscovery/naabu)** - Fast port scanner
- **[Httpx](https://github.com/projectdiscovery/httpx)** - HTTP toolkit
- **[S3Scanner](https://github.com/sa7mon/s3scanner)** - S3 bucket enumeration
- **[Anew](https://github.com/tomnomnom/anew)** - Tool for adding new lines to files
- **[Cloudflair](https://github.com/projectdiscovery/cloudflair)** - CloudFlare enumeration
- **[Nuclei](https://github.com/projectdiscovery/nuclei)** - Vulnerability scanner
- **[Katana](https://github.com/projectdiscovery/katana)** - Web crawler
- **[DNSx](https://github.com/projectdiscovery/dnsx)** - DNS toolkit
- **[TLSx](https://github.com/projectdiscovery/tlsx)** - TLS data extraction

### Python-based Tools
- **[Pacu](https://github.com/RhinoSecurityLabs/pacu)** - AWS exploitation framework
- **[Cloud_enum](https://github.com/initstring/cloud_enum)** - Multi-cloud OSINT tool
- **[CloudBrute](https://github.com/0xsha/CloudBrute)** - Multi-cloud enumeration tool

### Additional Tools
- **AWS CLI** - Amazon Web Services command line interface

## 🎯 Supported Platforms

- **Operating System**: Linux (tested on Kali Linux, Ubuntu, Debian)
- **Architecture**: x86_64 (amd64)
- **Requirements**: Internet connection, sudo privileges

## 📦 Prerequisites

The script will automatically install:
- Go (if not present)
- Python3 and pip3 dependencies
- Required system packages

## 🔧 Usage Examples

After installation, you can use the tools like this:

### Subdomain Discovery
```bash
subfinder -d example.com -o subdomains.txt
```

### Cloud Asset Enumeration
```bash
cloudlist -provider aws -id your-access-key -secret your-secret-key
```

### S3 Bucket Scanning
```bash
s3scanner -bucket target-bucket-name
```

### Vulnerability Scanning
```bash
nuclei -u https://example.com -t ~/nuclei-templates/
```

### Multi-cloud Enumeration
```bash
python3 ~/tools/cloud_enum/cloud_enum.py -k example
```

### AWS Exploitation Framework
```bash
cd ~/tools/pacu
python3 pacu.py
```

## ⚙️ Configuration

### AWS Credentials
```bash
aws configure
# Enter your AWS Access Key ID, Secret Access Key, and region
```

### Azure CLI
```bash
az login
```

### Google Cloud
```bash
gcloud auth login
```

## 🔍 Tool Locations

- **Go tools**: `~/go/bin/` (added to PATH)
- **System tools**: `/usr/local/bin/`
- **Python tools**: `~/tools/`

## 🛠️ Manual Installation

If the automated script fails, you can install tools manually:

```bash
# Install Go
wget https://go.dev/dl/go1.22.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.22.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Install a specific tool
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
```

## 🚨 Legal Disclaimer

**IMPORTANT**: These tools are for authorized security testing only. 

- Only use on systems you own or have explicit written permission to test
- Unauthorized access to computer systems is illegal
- Users are responsible for compliance with applicable laws
- The repository maintainers are not responsible for misuse

## 🐛 Troubleshooting

### Common Issues

**Go installation fails**
```bash
# Check if Go is accessible
go version
# If not found, manually add to PATH
export PATH=$PATH:/usr/local/go/bin
```

**Tool not found after installation**
```bash
# Reload shell configuration
source ~/.bashrc
# Or check if tool is in correct location
ls ~/go/bin/
```

**Permission denied**
```bash
# Make sure script is executable
chmod +x tools.sh
# Run with proper permissions
sudo ./tools.sh
```

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Test your changes
4. Submit a pull request

### Adding New Tools

To add a new Go-based tool, update the `tools.sh` script:

```bash
install_go_tool "github.com/author/tool-name/cmd/tool" "ToolName"
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⭐ Star History

If you find this project useful, please consider giving it a star!

## 📞 Support

- Create an [Issue](https://github.com/yourusername/cloud-hacking-tools/issues) for bugs
- Start a [Discussion](https://github.com/yourusername/cloud-hacking-tools/discussions) for questions
- Check existing issues before creating new ones

## 🔗 Related Projects

- [ProjectDiscovery Tools](https://github.com/projectdiscovery)
- [Awesome Cloud Security](https://github.com/4ndersonLin/awesome-cloud-security)
- [PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings)

---

**Made with ❤️ for the security community**
