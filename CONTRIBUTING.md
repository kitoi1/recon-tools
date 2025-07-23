# Contributing to Cloud Hacking Tools Auto-Installer

Thank you for your interest in contributing! This document provides guidelines for contributing to this project.

## 🤝 How to Contribute

### Reporting Issues

Before creating an issue, please:
1. Check if the issue already exists
2. Use the issue templates when available
3. Provide detailed information about your environment

**Bug Report Should Include:**
- Operating system and version
- Error messages (full output)
- Steps to reproduce
- Expected vs actual behavior

### Suggesting New Tools

When suggesting a new tool for inclusion:
1. Open an issue with the "enhancement" label
2. Provide the following information:
   - Tool name and GitHub repository
   - Brief description of what it does
   - Why it's useful for cloud security testing
   - Installation method (Go, Python, binary, etc.)

### Pull Requests

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/add-new-tool
   ```
3. **Make your changes**
4. **Test thoroughly**
5. **Commit with descriptive messages**
   ```bash
   git commit -m "Add CloudMapper tool for AWS visualization"
   ```
6. **Push and create PR**

## 📋 Development Guidelines

### Adding New Tools

#### Go-based Tools
```bash
# Add to tools.sh in the appropriate section
install_go_tool "github.com/author/tool-name/cmd/tool" "ToolName"
```

#### Python-based Tools
```bash
# Add installation logic similar to existing Python tools
echo -e "${YELLOW}  Installing NewTool...${NC}"
if git clone https://github.com/author/newtool.git; then
    cd newtool
    if command -v pip3 &> /dev/null; then
        pip3 install -r requirements.txt
        chmod +x newtool.py
        sudo ln -sf $(pwd)/newtool.py /usr/local/bin/newtool
        echo -e "${GREEN}  ✓ NewTool installed${NC}"
    fi
    cd ..
fi
```

#### Binary Tools
```bash
# For tools distributed as binaries
wget https://github.com/author/tool/releases/latest/download/tool-linux-amd64
chmod +x tool-linux-amd64
sudo mv tool-linux-amd64 /usr/local/bin/tool
```

### Code Style

- Use consistent indentation (2 spaces)
- Add error handling for all downloads/installations
- Include colored output for better UX
- Test on multiple Linux distributions if possible

### Documentation

When adding new tools:
1. Update the README.md tools list
2. Add usage examples
3. Include any special configuration requirements

## 🧪 Testing

Before submitting a PR:

### Basic Testing
```bash
# Test on clean system (VM recommended)
chmod +x tools.sh
./tools.sh

# Verify tools are accessible
which subfinder
which nuclei
# etc.
```

### Test Scenarios
- Fresh installation on clean system
- Re-running script (should handle existing installations)
- Network connectivity issues
- Permission problems

## 📝 Commit Message Format

Use clear, descriptive commit messages:

```
feat: add CloudMapper for AWS visualization
fix: resolve Go installation on Ubuntu 22.04
docs: update README with Azure CLI configuration
refactor: improve error handling in tool installation
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

## 🔍 Tool Criteria

Tools should meet these criteria for inclusion:

### Must Have
- Actively maintained (recent commits)
- Clear security/cloud testing purpose
- Reliable installation method
- Open source

### Should Have
- Good documentation
- Community adoption
- Unique functionality (not duplicate existing tools)

### Nice to Have
- Multiple cloud provider support
- Integration with other tools in the suite

## 🚨 Security Considerations

When contributing:

- **Never include credentials** in code or documentation
- **Test tools safely** - use isolated environments
- **Verify tool authenticity** - check SHA hashes when possible
- **Document security implications** of new tools

## 📋 Pull Request Checklist

- [ ] Tested on clean Linux system
- [ ] Updated README.md if adding new tools
- [ ] Added error handling for new installations
- [ ] Verified all tools are accessible after installation
- [ ] Included usage examples for new tools
- [ ] Followed existing code style
- [ ] No sensitive information included

## ❓ Questions?

- Open a [Discussion](https://github.com/kitoi1/recon-tools/doccuments)
- Create an [Issue](https://github.com/kitoi1/recon-tools/issues)
- Contact maintainers through GitHub

## 🏆 Recognition

Contributors will be:
- Listed in the repository contributors
- Mentioned in release notes for significant contributions
- Credited in the README if they add major features

Thank you for helping make cloud security testing more accessible! 🙏
