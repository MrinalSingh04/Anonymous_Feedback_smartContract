# Anonymous Feedback Box - Smart Contract

## Overview

The `AnonymousFeedbackBox` smart contract allows users to submit anonymous feedback securely, with the feedback being stored in a decentralized and tamper-proof way. The feedback is stored as an IPFS hash, ensuring privacy and security. Only the contract's admin can view the feedback.

## Features

- **Submit Anonymous Feedback**: Users can submit feedback without revealing their identity. The feedback is stored as an IPFS hash, ensuring privacy.
- **Admin-Only Access**: The admin is the only entity that can access the feedback stored on the blockchain.
- **Change Admin**: The admin can be changed, allowing for contract management by another address.
- **Feedback Count**: The number of feedback entries can be accessed via a public function.
- **Timestamp**: Each feedback submission includes a timestamp for tracking when it was submitted.

## Why This Contract?

- **Privacy**: Feedback is stored anonymously via IPFS hashes. The actual feedback data never appears directly on the blockchain, ensuring privacy for users.
- **Decentralized**: Storing the feedback on a blockchain guarantees that the data is immutable and accessible at all times, without relying on any centralized server.
- **Security**: Using an IPFS hash ensures the data integrity of the feedback and minimizes the risk of tampering.
- **Flexibility**: The contract allows the admin to change, making it adaptable to new contract management needs.

## How It Works

1. **Submit Feedback**:
   - Any user can submit feedback via the `submitFeedback` function, providing an IPFS hash of the feedback text. The hash points to the feedback data stored off-chain.
2. **Retrieve Feedback**:
   - The admin can use the `getFeedback` function to view feedback by providing the feedback ID. This returns the IPFS hash and the timestamp.
3. **Count Feedback**:

   - The `getFeedbackCount` function allows anyone to retrieve the total number of feedback entries submitted.

4. **Admin Management**:
   - The contract includes the ability to change the admin via the `changeAdmin` function, ensuring that the contract can be managed by a different address if necessary.

## Functions

### `submitFeedback(string calldata ipfsHash)`

- **Description**: Submit anonymous feedback with an IPFS hash.
- **Parameters**:
  - `ipfsHash`: The IPFS hash pointing to the feedback content.
- **Emit**: `FeedbackSubmitted(uint id, string ipfsHash)`

### `getFeedback(uint id) external view onlyAdmin returns (string memory, uint256)`

- **Description**: Retrieve feedback by ID. Only the admin can view the feedback.
- **Parameters**:
  - `id`: The ID of the feedback.
- **Returns**:
  - `ipfsHash`: The IPFS hash of the feedback.
  - `timestamp`: The timestamp of the feedback submission.

### `getFeedbackCount() external view returns (uint)`

- **Description**: Get the total number of feedback entries.
- **Returns**:
  - `feedbackCount`: The total number of feedback entries submitted.

### `changeAdmin(address newAdmin) external onlyAdmin`

- **Description**: Change the admin address.
- **Parameters**:
  - `newAdmin`: The new admin address.

## Security Considerations

- The contract relies on IPFS to store the actual feedback content, so the security of the feedback depends on the IPFS network's reliability.
- Only the admin has access to retrieve the feedback, ensuring that it remains private to others.
- Feedback cannot be changed once submitted, ensuring the immutability of the records.

## Deployment

To deploy the contract, you can use the following steps:

1. Use a tool like [Remix](https://remix.ethereum.org/) or [Truffle](https://www.trufflesuite.com/truffle) to compile and deploy the contract.
2. After deployment, the contract can be interacted with using the Ethereum address that deployed the contract.
3. The contract’s admin can be changed by calling the `changeAdmin` function.

## License

This contract is licensed under the MIT License.
