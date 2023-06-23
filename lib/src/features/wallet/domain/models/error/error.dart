import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';

class WebSocketError extends WebSocketResponse {
  WebSocketError({this.message});

  final String? message;
}
