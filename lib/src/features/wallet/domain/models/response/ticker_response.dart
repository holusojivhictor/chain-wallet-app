// ignore_for_file: invalid_annotation_target
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticker_response.freezed.dart';
part 'ticker_response.g.dart';

@freezed
class TickerResponse extends WebSocketResponse with _$TickerResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory TickerResponse({
    required String? channel,
    required String? clientId,
    required DateTime? timestamp,
    required int? sequenceNum,
    required List<Events>? events,
  }) = _TickerResponse;

  factory TickerResponse.fromJson(Map<String, dynamic> json) =>
      _$TickerResponseFromJson(json);
}

@freezed
class Events with _$Events {
  factory Events({
    required String? type,
    required List<TickerEvent>? tickers,
  }) = _Events;

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);
}

@freezed
class TickerEvent with _$TickerEvent {
  factory TickerEvent({
    required String? type,
    required String? productId,
    @StringToDoubleConverter()
        required double? price,
    @JsonKey(name: 'low_24_h')
    @StringToDoubleConverter()
        required double? low24H,
    @JsonKey(name: 'high_24_h')
    @StringToDoubleConverter()
        required double? high24H,
    @JsonKey(name: 'price_percent_chg_24_h')
    @StringToDoubleConverter()
        required double? change,
  }) = _TickerEvent;

  factory TickerEvent.fromJson(Map<String, dynamic> json) =>
      _$TickerEventFromJson(json);
}

@freezed
class SubscriptionResponse extends WebSocketResponse
    with _$SubscriptionResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory SubscriptionResponse({
    required String? channel,
    required String? clientId,
    required DateTime? timestamp,
    required int? sequenceNum,
    required List<SubscriptionEvents>? events,
  }) = _SubscriptionResponse;

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResponseFromJson(json);
}

@freezed
class SubscriptionEvents with _$SubscriptionEvents {
  factory SubscriptionEvents({
    required Map<String, List<String>>? subscriptions,
  }) = _SubscriptionEvents;

  factory SubscriptionEvents.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionEventsFromJson(json);
}

class StringToDoubleConverter implements JsonConverter<double?, String?> {
  const StringToDoubleConverter();

  @override
  double? fromJson(String? json) => json == null ? null : double.parse(json);

  @override
  String? toJson(double? object) => object.toString();
}
