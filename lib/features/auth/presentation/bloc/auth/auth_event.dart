import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

/// Authentication events
@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = LoginEvent;
  const factory AuthEvent.signUp({
    required String email,
    required String password,
    required String name,
  }) = SignUpEvent;
  const factory AuthEvent.logout() = LogoutEvent;
  const factory AuthEvent.checkAuthStatus() = CheckAuthStatusEvent;
}
