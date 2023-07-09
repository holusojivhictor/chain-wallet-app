import 'package:equatable/equatable.dart';

class Recent extends Equatable {
  const Recent({
    required this.key,
    required this.address,
    required this.avatar,
  });

  final int key;
  final String address;
  final String avatar;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'key': key,
      'address': address,
      'avatar': avatar,
    };
  }

  @override
  List<Object?> get props => <Object?>[
    key,
    address,
    avatar,
  ];
}
