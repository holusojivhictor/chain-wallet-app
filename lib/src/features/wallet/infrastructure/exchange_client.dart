import 'dart:convert';

import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:crypto/crypto.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum Action {
  subscribe,
  unsubscribe,
}

const String authority = 'wss://advanced-trade-ws.coinbase.com';

class ExchangeClient {
  ExchangeClient(
    this.credential,
    this.secret, {
    WebSocketChannel? channel,
  }) : _channel = channel ?? WebSocketChannel.connect(Uri.parse(authority));

  ExchangeClient.anonymous({
    WebSocketChannel? channel,
  })  : credential = null,
        secret = null,
        _channel = channel ?? WebSocketChannel.connect(Uri.parse(authority));

  final String? credential;
  final String? secret;
  final WebSocketChannel _channel;

  String _request({
    String? type,
    List<String>? productIds,
  }) {
    const channel = 'ticker';
    final timestamp =
        (DateTime.now().millisecondsSinceEpoch * 0.001).floor().toString();

    final signature = _calculateSig(
      channel: channel,
      timestamp: timestamp,
      productIds: productIds,
    );

    final request = <String, dynamic>{
      'type': type,
      'channel': channel,
      'api_key': credential,
      'timestamp': timestamp,
      'signature': signature,
    };

    if (productIds != null) request['product_ids'] = productIds;

    return json.encode(request);
  }

  String _calculateSig({
    required String channel,
    required String timestamp,
    required List<String>? productIds,
  }) {
    final products = productIds?.join(',');
    var message = timestamp + channel;

    if (products != null) {
      message += products;
    }

    final messageBytes = utf8.encode(message);
    final hmacKey = utf8.encode(secret ?? '');
    final hmac = Hmac(sha256, hmacKey);
    final digest = hmac.convert(messageBytes);

    return digest.toString();
  }

  WebSocketResponse _response(Map<String, dynamic> event) {
    final channel = event['channel'];
    if (channel == 'ticker') {
      return TickerResponse.fromJson(event);
    } else if (channel == 'subscriptions') {
      return SubscriptionResponse.fromJson(event);
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
    return _channel.stream
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
