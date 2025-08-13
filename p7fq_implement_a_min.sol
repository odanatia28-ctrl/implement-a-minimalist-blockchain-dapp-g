pragma solidity ^0.8.0;

/**
 * @title Blockchain dApp Generator
 * @author [Your Name]
 * @notice This is a minimalist Solidity contract for generating a blockchain dApp
 */

contract BlockchainDappGenerator {
    // Mapping to store generated dApps
    mapping(address => address[]) public generatedDapps;

    // Event emitted when a new dApp is generated
    event NewDappGenerated(address indexed _creator, address _dappAddress);

    /**
     * @notice Generate a new dApp with a unique name and deployment address
     * @param _dappName Name of the dApp
     * @return The deployment address of the generated dApp
     */
    function generateDapp(string memory _dappName) public {
        // Create a new contract instance with the provided name
        BlockchainDapp dapp = new BlockchainDapp(_dappName);

        // Store the deployment address of the generated dApp
        generatedDapps[msg.sender].push(address(dapp));

        // Emit the NewDappGenerated event
        emit NewDappGenerated(msg.sender, address(dapp));

        // Return the deployment address of the generated dApp
        return address(dapp);
    }
}

/**
 * @title Generated dApp contract
 * @notice A basic contract representing a generated dApp
 */
contract BlockchainDapp {
    string public name;

    /**
     * @param _name Name of the dApp
     */
    constructor(string memory _name) {
        name = _name;
    }

    /**
     * @notice A sample function for demonstration purposes
     * @return A greeting message
     */
    function greeting() public pure returns (string memory) {
        return "Hello from " + name + " dApp!";
    }
}