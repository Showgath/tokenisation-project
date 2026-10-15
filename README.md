# Rental Income Tokenisation Smart Contract

This repository contains a Solidity smart contract for rental income tokenisation, built for IFTE0007 coursework on asset tokenisation.

## Overview

`RentalIncomeToken.sol` implements an ERC20-style token model where holders can receive proportional rental income distributions in ETH.

## Key Features

- Token minting at deployment time via constructor initial supply
- Standard token transfer, approval, and delegated transfer (`transferFrom`)
- Owner-only rental income deposits
- Pro-rata ETH distribution based on token ownership at claim time

## Repository Contents

- `RentalIncomeToken.sol` — smart contract source code

## Network

- **Testnet:** Sepolia
- **Contract Address:** [`0x98405Ba1aC2FED495Fc1169fA2E23f3D4EEEF0AB`](https://sepolia.etherscan.io/address/0x98405Ba1aC2FED495Fc1169fA2E23f3D4EEEF0AB)

## Quick Start (Remix)

1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a new file and paste the contents of `RentalIncomeToken.sol`.
3. Compile with Solidity `^0.8.20`.
4. Deploy using constructor input `_initialSupply` (whole-token units before 18 decimals scaling).
5. Interact with:
   - `depositRentalIncome()` (owner sends ETH)
   - `claimIncome()` (holders claim accrued ETH)

## Notes

- Rental income accounting updates are triggered on transfer/transferFrom/claim.
- This contract is coursework code and should be independently audited before production use.
