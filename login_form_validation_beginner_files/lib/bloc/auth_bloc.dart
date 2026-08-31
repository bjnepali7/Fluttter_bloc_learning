import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    //login Event
    on<AuthLoginRequestedEvent>(_onAuthLoginRequest);
    //logout event
    on<AuthLogoutRequestedEvent>(_onAuthLogoutRequested);
  }

  void _onAuthLogoutRequested(
      AuthLogoutRequestedEvent event, Emitter<AuthState> emit) async {
    emit(AuthInitial());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void _onAuthLoginRequest(
      AuthLoginRequestedEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final email = event.email;
      final password = event.password;

      // Validation
      if (password.length < 8) {
        emit(AuthError("Password must be at least 8 characters"));
        return;
      }

      // Simulating login API call
      await Future.delayed(const Duration(seconds: 2));

      emit(AuthSucess("$email-$password"));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
