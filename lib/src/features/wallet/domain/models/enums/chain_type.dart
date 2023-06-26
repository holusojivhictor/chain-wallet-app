enum EthereumChain {
  mainnet(
    'https://mainnet.infura.io/v3',
    'wss://mainnet.infura.io/ws/v3',
  ),
  goerli(
    'https://goerli.infura.io/v3',
    'wss://goerli.infura.io/ws/v3',
  ),
  sepolia(
    'https://sepolia.infura.io/v3',
    'wss://sepolia.infura.io/ws/v3',
  );

  const EthereumChain(this.rpcBase, this.wsBase);

  final String rpcBase;
  final String wsBase;
}
