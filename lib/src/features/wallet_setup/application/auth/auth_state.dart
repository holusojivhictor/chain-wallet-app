part of 'auth_cubit.dart';

enum AuthStatus {
  loading,
  setup,
  connected,
  failed,
}

enum AppStatus {
  locked,
  unlocked,
  busy,
}

class AuthState extends Equatable {
  const AuthState({
    required this.status,
    required this.appStatus,
  });

  const AuthState.init()
      : status = AuthStatus.loading,
        appStatus = AppStatus.locked;

  final AuthStatus status;
  final AppStatus appStatus;

  AuthState copyWith({
    AuthStatus? status,
    AppStatus? appStatus,
  }) {
    return AuthState(
      status: status ?? this.status,
      appStatus: appStatus ?? this.appStatus,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    status,
    appStatus,
  ];
}
