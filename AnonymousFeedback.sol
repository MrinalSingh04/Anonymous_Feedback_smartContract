// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract AnonymousFeedbackBox {
    address public admin;
    uint public feedbackCount;

    struct Feedback {
        string ipfsHash; // or use hash of text for privacy
        uint256 timestamp;
    }

    mapping(uint => Feedback) private feedbacks;

    event FeedbackSubmitted(uint indexed id, string ipfsHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    // Submit feedback with an IPFS hash
    function submitFeedback(string calldata ipfsHash) external {
        feedbacks[feedbackCount] = Feedback(ipfsHash, block.timestamp);
        emit FeedbackSubmitted(feedbackCount, ipfsHash);
        feedbackCount++;
    }

    // Retrieve feedback by ID (admin-only access)
    function getFeedback(
        uint id
    ) external view onlyAdmin returns (string memory, uint256) {
        require(id < feedbackCount, "Invalid feedback ID");
        Feedback memory fb = feedbacks[id];
        return (fb.ipfsHash, fb.timestamp);
    }

    // Retrieve total feedback count
    function getFeedbackCount() external view returns (uint) {
        return feedbackCount;
    }

    // Change the admin address
    function changeAdmin(address newAdmin) external onlyAdmin {
        require(newAdmin != address(0), "Invalid address");
        admin = newAdmin;
    }
}
