import 'package:web3dart/crypto.dart';

class CryptoUtils {
  static final RegExp _basicAddress = RegExp(
    '^(0x)?[0-9a-f]{40}',
    caseSensitive: false,
  );

  static bool isValidAddress(String hex, {bool enforceEip55 = false}) {
    if (!_basicAddress.hasMatch(hex)) {
      return false;
    }

    if (!enforceEip55 &&
        (hex.toUpperCase() == hex || hex.toLowerCase() == hex)) {
      return true;
    }

    final address = strip0x(hex);
    final hash = bytesToHex(keccakAscii(address.toLowerCase()));
    for (var i = 0; i < 40; i++) {
      final hashedPos = int.parse(hash[i], radix: 16);
      if ((hashedPos > 7 && address[i].toUpperCase() != address[i]) ||
          (hashedPos <= 7 && address[i].toLowerCase() != address[i])) {
        return false;
      }
    }
    return true;
  }
}
