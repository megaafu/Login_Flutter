sealed class AuthState {
  T when<T>({
    required T Function() init,
    T Function(LoadingState state)? loading,
    T Function(LoggedState state)? logged,
    T Function(RegisteredState state)? registered,
    T Function(LoggedOutState state)? loggedout,
    T Function(ErrorState state)? error,
  }) {
    return switch (this) {
      InitState _ => init(),
      LoadingState s => loading?.call(s) ?? init(),
      LoggedState s => logged?.call(s) ?? init(),
      RegisteredState s => registered?.call(s) ?? init(),
      LoggedOutState s => loggedout?.call(s) ?? init(),
      ErrorState s => error?.call(s) ?? init(),
    };
  }
}

class InitState extends AuthState {}

class LoadingState extends AuthState {}

class LoggedState extends AuthState {}

class RegisteredState extends AuthState {}

class LoggedOutState extends AuthState {}

class ErrorState extends AuthState {
  final String error;
  ErrorState(this.error);
}
