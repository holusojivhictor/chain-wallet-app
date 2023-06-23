import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticker.freezed.dart';
part 'ticker.g.dart';

@freezed
class Ticker extends WebSocketResponse with _$Ticker {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Ticker({
    required int? tradeId,
    required int? sequence,
    required DateTime? time,
    required String? productId,
    @StringToDoubleConverter() required double? price,
    required String? side,
    @StringToDoubleConverter() required double? lastSize,
    @StringToDoubleConverter() required double? bestBid,
    @StringToDoubleConverter() required double? bestAsk,
  }) = _Ticker;

  factory Ticker.fromJson(Map<String, dynamic> json) => _$TickerFromJson(json);
}

class StringToDoubleConverter implements JsonConverter<double?, String?> {
  const StringToDoubleConverter();

  @override
  double? fromJson(String? json) => json == null ? null : double.parse(json);

  @override
  String? toJson(double? object) => object.toString();
}