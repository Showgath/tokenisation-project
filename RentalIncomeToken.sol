// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RentalIncomeToken {
    string public name = "Rental Income Token";
    string public symbol = "RIT";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event IncomeDeposited(uint256 amount);
    event IncomeClaimed(address indexed holder, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can do this");
        _;
    }

    uint256 public totalIncomePerToken;
    mapping(address => uint256) public incomeCreditedTo;
    mapping(address => uint256) public incomeBalance;

    constructor(uint256 _initialSupply) {
        owner = msg.sender;
        totalSupply = _initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0), "Invalid address");
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        _updateIncome(msg.sender);
        _updateIncome(_to);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_spender != address(0), "Invalid address");
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(0), "Invalid address");
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Allowance exceeded");

        _updateIncome(_from);
        _updateIncome(_to);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        return true;
    }

    function depositRentalIncome() public payable onlyOwner {
        require(msg.value > 0, "Send some ETH");
        require(totalSupply > 0, "No tokens exist");

        totalIncomePerToken += (msg.value * 1e18) / totalSupply;
        emit IncomeDeposited(msg.value);
    }

    function claimIncome() public {
        _updateIncome(msg.sender);

        uint256 amount = incomeBalance[msg.sender];
        require(amount > 0, "No income to claim");

        incomeBalance[msg.sender] = 0;
        payable(msg.sender).transfer(amount);

        emit IncomeClaimed(msg.sender, amount);
    }

    function _updateIncome(address account) internal {
        uint256 owed = ((balanceOf[account] * (totalIncomePerToken - incomeCreditedTo[account])) / 1e18);
        if (owed > 0) {
            incomeBalance[account] += owed;
        }
        incomeCreditedTo[account] = totalIncomePerToken;
    }
}