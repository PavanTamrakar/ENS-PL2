require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.10",
  network : {
    hardhat : {
    },
    loggingEnabled : true,
    mumbai : {
      url : "https://stylish-side-knowledge.matic-testnet.discover.quiknode.pro/86ce51f25bcc9f03ce5d4738f446fc3b623f3b1f/",
      accounts : ["0e8f28e64762e22c60a61087a2fa7bde110782573c7f290886dc7f14ade07047"],
    },
  },
};