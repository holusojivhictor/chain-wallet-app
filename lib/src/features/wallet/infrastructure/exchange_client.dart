import 'dart:convert';

import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum Action {
  subscribe,
  unsubscribe,
}

const String authority = 'wss://ws-feed.exchange.coinbase.com';

class ExchangeClient {
  ExchangeClient(
    this.credential, {
    WebSocketChannel? channel,
  }) : _channel = channel ?? WebSocketChannel.connect(Uri.parse(authority));

  ExchangeClient.anonymous({
    WebSocketChannel? channel,
  })  : credential = null,
        _channel = channel ?? WebSocketChannel.connect(Uri.parse(authority));

  final String? credential;
  final WebSocketChannel _channel;

  String _request({
    String? type,
    List<String>? productIds,
  }) {
    final request = <String, dynamic>{
      'type': type,
      'channels': <String>['ticker'],
    };

    if (productIds != null) request['product_ids'] = productIds;

    return json.encode(request);
  }

  WebSocketResponse _response(Map<String, dynamic> event) {
    final type = event['type'];
    if (type == 'ticker') {
      return TickerResponse.fromJson(event);
    } else if (type == 'error') {
      return WebSocketError(message: event['message'].toString());
    } else {
      throw Exception('An unknown event has occurred: $event');
    }
  }

  Stream<WebSocketResponse> _manageSubscription({
    required Action action,
    List<String>? productIds,
  }) {
    final request = _request(
      type: action.name,
      productIds: productIds,
    );

    _channel.sink.add(request);
    return _channel.stream.skip(1)
        .map((event) => jsonDecode(event as String))
        .map((event) => _response(event as Map<String, dynamic>));
  }

  Stream<WebSocketResponse> subscribe({
    List<String>? productIds,
  }) {
    return _manageSubscription(
      action: Action.subscribe,
      productIds: productIds,
    );
  }

  Stream<WebSocketResponse> unsubscribe({
    List<String>? productIds,
  }) {
    return _manageSubscription(
      action: Action.unsubscribe,
      productIds: productIds,
    );
  }

  Future<void> close() async {
    await _channel.sink.close();
  }
}
