part of 'auth_cubit.dart';

enum AuthStatus {
  loading,
  setup,
  connected,
  failed,
}

class AuthState extends Equatable {
  const AuthState({
    required this.status,
  });

  const AuthState.init() : status = AuthStatus.loading;

  final AuthStatus status;

  AuthState copyWith({
    AuthStatus? status,
  }) {
    return AuthState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    status,
  ];
}
