part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class AuthLoginRequestedEvent extends AuthEvent {
  AuthLoginRequestedEvent({required this.email, required this.password});
  final String email;
  final String password;
}

final class AuthLogoutRequestedEvent extends AuthEvent{
  
}
