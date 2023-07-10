import 'dart:typed_data';

import 'package:chain_wallet/chain_wallet.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

part 'transactions_bloc.freezed.dart';
part 'transactions_event.dart';
part 'transactions_state.dart';

const String _identifier = 'TransactionsBlocListener';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState>
    implements WalletEventHandler {
  TransactionsBloc() : super(const TransactionsState.init()) {
    ChainWalletManager.instance.addEventHandler(_identifier, this);
    on<_Init>(_onInit);
  }

  void _onInit(_Init event, Emitter<TransactionsState> emit) {}

  @override
  void Function(
    EthereumAddress agent,
  )? get onAgentDeployed {
    return null;
  }

  @override
  void Function(
    Uint8List hash,
    TransactionReceipt? receipt,
  )? get onTransactionEmitted {
    return (txHash, _) {
      print('Hash babbyyy ${bytesToHex(txHash)}');
    };
  }

  @override
  Future<void> close() async {
    ChainWalletManager.instance.removeEventHandler(_identifier);
    return super.close();
  }
}
