import 'dart:ui';

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

  String get label {
    switch (this) {
      case EthereumChain.mainnet:
        return 'Ethereum Main Network';
      case EthereumChain.goerli:
        return 'Goerli Test Network';
      case EthereumChain.sepolia:
        return 'Sepolia Test Network';
    }
  }

  String get avatar {
    switch (this) {
      case EthereumChain.mainnet:
        return 'E';
      case EthereumChain.goerli:
      case EthereumChain.sepolia:
        return name.substring(0, 1).toUpperCase();
    }
  }

  Color get bgColor {
    switch (this) {
      case EthereumChain.mainnet:
        return const Color(0xFF627EEB);
      case EthereumChain.goerli:
        return const Color(0xFF309AF2);
      case EthereumChain.sepolia:
        return const Color(0xFFCEB5EF);
    }
  }
}
