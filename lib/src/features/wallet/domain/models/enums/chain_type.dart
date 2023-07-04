import 'dart:ui';

enum ChainType {
  mainnet(
    1,
    'Ethereum',
    'ETH',
  ),
  goerli(
    5,
    'GoerliETH',
    'GoerliETH',
  ),
  sepolia(
    11155111,
    'SepoliaETH',
    'SepoliaETH',
  );

  const ChainType(this.id, this.name, this.currency);

  final int id;
  final String name;
  final String currency;

  String get rpcBase {
    switch (this) {
      case ChainType.mainnet:
        return 'https://mainnet.infura.io/v3';
      case ChainType.goerli:
        return 'https://goerli.infura.io/v3';
      case ChainType.sepolia:
        return 'https://sepolia.infura.io/v3';
    }
  }

  String get wsBase {
    switch (this) {
      case ChainType.mainnet:
        return 'wss://mainnet.infura.io/ws/v3';
      case ChainType.goerli:
        return 'wss://goerli.infura.io/ws/v3';
      case ChainType.sepolia:
        return 'wss://sepolia.infura.io/ws/v3';
    }
  }

  String get label {
    switch (this) {
      case ChainType.mainnet:
        return 'Ethereum Main Network';
      case ChainType.goerli:
        return 'Goerli Test Network';
      case ChainType.sepolia:
        return 'Sepolia Test Network';
    }
  }

  String get avatar => currency.substring(0, 1).toUpperCase();

  Color get bgColor {
    switch (this) {
      case ChainType.mainnet:
        return const Color(0xFF627EEB);
      case ChainType.goerli:
        return const Color(0xFF309AF2);
      case ChainType.sepolia:
        return const Color(0xFFCEB5EF);
    }
  }
}
