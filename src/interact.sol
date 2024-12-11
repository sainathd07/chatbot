const Web3 = require('web3');

// Connect to the blockchain
const web3 = new Web3('https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID');

// Smart contract details
const contractAddress = '0xYourDeployedContractAddress';
const abi = [ /* ABI generated during compilation */ ];

// Create contract instance
const contract = new web3.eth.Contract(abi, contractAddress);

// Deposit Ether
async function depositEther(amountInEther) {
    const accounts = await web3.eth.getAccounts();
    await contract.methods.deposit().send({
        from: accounts[0],
        value: web3.utils.toWei(amountInEther, 'ether'),
    });
    console.log('Deposit successful');
}

// Get Balance
async function getBalance() {
    const accounts = await web3.eth.getAccounts();
    const balance = await contract.methods.getBalance().call({ from: accounts[0] });
    console.log(`Your balance: ${web3.utils.fromWei(balance, 'ether')} ETH`);
}

// Withdraw Ether
async function withdrawEther(amountInEther) {
    const accounts = await web3.eth.getAccounts();
    await contract.methods.withdraw(web3.utils.toWei(amountInEther, 'ether')).send({
        from: accounts[0],
    });
    console.log('Withdrawal successful');
}
