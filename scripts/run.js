const main = async () => {
    const domainContractFactory = await hre.ethers.getContractFactory('Domains');
    const domainContract = await domainContractFactory.deploy("drugs");
    await domainContract.deployed();

    console.log("drugs Name Service Deployed")
    console.log("Contract deployed to:", domainContract.address);
    
    let txn = await domainContract.register("MonkOn", {value: hre.ethers.utils.parseEther('0.1')});
    await txn.wait();

    const address = await domainContract.getAddress("MonkOn");
    console.log("Owner of domain:", address);
  
    const balance = await hre.ethers.provider.getBalance(domainContract.address);
    console.log("Contract balance:", hre.ethers.utils.formatEther(balance));
  }
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();