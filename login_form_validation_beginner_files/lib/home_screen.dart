import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_login_ui/bloc/auth_bloc.dart';
import 'package:flutter_responsive_login_ui/login_screen.dart';
import 'package:flutter_responsive_login_ui/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // Navigate to LoginScreen after logout
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => LoginScreen(),
              ),
              (route) => false,
            );
          }
        },

        builder: (context, state) {
          // Show loading indicator
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Show HomeScreen content only when login is successful
          if (state is AuthSucess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(state.id),
                ),

                const SizedBox(height: 20),

                GradientButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      AuthLogoutRequestedEvent(),
                    );
                  },
                ),
              ],
            );
          }

          // Prevent crash for AuthInitial or any other state
          return const SizedBox();
        },
      ),
    );
  }
}