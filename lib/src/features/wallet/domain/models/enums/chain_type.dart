enum EthereumChain {
  mainnet(
    'https://mainnet.infura.io/v3',
    'wss://mainnet.infura.io/ws/v3',
    'ETH',
  ),
  goerli(
    'https://goerli.infura.io/v3',
    'wss://goerli.infura.io/ws/v3',
    'GoerliETH',
  ),
  sepolia(
    'https://sepolia.infura.io/v3',
    'wss://sepolia.infura.io/ws/v3',
    'SepoliaETH',
  );

  const EthereumChain(this.rpcBase, this.wsBase, this.currency);

  final String rpcBase;
  final String wsBase;
  final String currency;
}
