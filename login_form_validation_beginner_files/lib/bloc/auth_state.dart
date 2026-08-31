part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSucess extends AuthState {
  final String id;

  AuthSucess(this.id);
}

final class AuthError extends AuthState {
  final String msg;

  AuthError(this.msg);
}

final class AuthLoading extends AuthState {}
