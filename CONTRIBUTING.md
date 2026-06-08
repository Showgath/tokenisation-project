# Contributing to Rental Income Tokenisation

Thank you for your interest in contributing! This document provides guidelines for contributing to this blockchain project.

## 🤝 How to Contribute

### 1. Fork and Clone
```bash
git clone https://github.com/YourUsername/tokenisation-project.git
cd tokenisation-project
```

### 2. Create a Feature Branch
```bash
git checkout -b feature/your-feature-name
```

Use descriptive branch names:
- `feature/add-dividend-mechanism`
- `bugfix/fix-income-calculation`
- `docs/improve-deployment-guide`

### 3. Make Your Changes
- Write clean, secure Solidity code
- Follow best practices for smart contracts
- Include NatSpec documentation for all functions
- Test thoroughly with Hardhat or Truffle

### 4. Commit Your Changes
```bash
git commit -m "Brief description of changes"
```

Use clear commit messages:
- ✅ Good: `feat: implement proportional income distribution`
- ✅ Good: `fix: prevent reentrancy in claimIncome`
- ❌ Bad: `update contract`

### 5. Push and Open a Pull Request
```bash
git push origin feature/your-feature-name
```

Then open a Pull Request with:
- Clear title describing the change
- Detailed description of what and why
- Security considerations and testing
- Reference to any related issues

---

## 📋 Before You Submit

- [ ] Code follows Solidity best practices
- [ ] Smart contract is tested thoroughly
- [ ] No security vulnerabilities (check with Slither)
- [ ] Documentation is updated if needed
- [ ] Gas optimization considered

---

## 🎯 Areas for Contribution

### High Priority
- [ ] Security audits and vulnerability fixes
- [ ] Gas optimization
- [ ] Enhanced testing and coverage
- [ ] Documentation improvements
- [ ] Bug fixes

### Medium Priority
- [ ] Additional token features
- [ ] Integration with DeFi protocols
- [ ] Enhanced event logging
- [ ] Upgrade mechanism (proxy patterns)

### Research Ideas
- [ ] Multi-signature income deposits
- [ ] Time-locked distributions
- [ ] Integration with staking mechanisms
- [ ] Cross-chain token bridges
- [ ] Governance token integration

---

## 💻 Development Setup

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install Hardhat and dependencies
npm install --save-dev hardhat
npx hardhat

# Compile contracts
npx hardhat compile

# Run tests
npx hardhat test

# Deploy to testnet
npx hardhat run scripts/deploy.js --network sepolia
```

---

## 📝 Code Style Guidelines

### Solidity
- Follow the Solidity Style Guide
- Use meaningful variable names
- Add NatSpec documentation for all public functions

### Example Function:
```solidity
/// @notice Allows holders to claim their proportional share of rental income
/// @dev Updates income tracking before transfer to prevent reentrancy
/// @return amount The amount of ETH claimed by the caller
function claimIncome() public returns (uint256) {
    _updateIncome(msg.sender);
    uint256 amount = incomeBalance[msg.sender];
    require(amount > 0, "No income to claim");
    // Implementation here
}
```

---

## 🔒 Security Considerations

When submitting code:

- [ ] No reentrancy vulnerabilities (use checks-effects-interactions pattern)
- [ ] Proper integer overflow/underflow protection (using SafeMath or Solidity 0.8.0+)
- [ ] Access control properly implemented
- [ ] Events properly emitted for all state changes
- [ ] Tested with Slither and other security tools

---

## 🐛 Reporting Issues

If you find a bug or security issue:

1. **For security issues**: Do NOT create a public issue. Email security details privately.
2. **For bugs**: Create an issue with:
   - Clear title and description
   - Steps to reproduce
   - Expected vs. actual behavior
   - Testnet contract address if applicable

---

## 📚 Documentation

When adding features:
- Update README.md if needed
- Add NatSpec documentation to smart contracts
- Include usage examples
- Document any contract state changes

---

## 🚀 Getting Help

- Review the [Technical Report](../../docs/technical-analysis.md) (if available)
- Check the main [README.md](README.md)
- Review the smart contract code with comments
- Ask questions in Issues

---

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing! 🎉
