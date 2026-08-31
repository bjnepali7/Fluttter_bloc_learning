import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_login_ui/bloc/auth_bloc.dart';
import 'package:flutter_responsive_login_ui/home_screen.dart';
import 'package:flutter_responsive_login_ui/widgets/gradient_button.dart';
import 'package:flutter_responsive_login_ui/widgets/login_field.dart';
import 'package:flutter_responsive_login_ui/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.msg),
              backgroundColor: Colors.red,
            ));
          }
          if (state is AuthSucess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("login sucessfull-${state.id}"),
              backgroundColor: Colors.green,
            ));
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomeScreen()));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/signin_balls.png'),
                  const Text(
                    'Sign in.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const SocialButton(
                      iconPath: 'assets/svgs/g_logo.svg',
                      label: 'Continue with Google'),
                  const SizedBox(height: 20),
                  const SocialButton(
                    iconPath: 'assets/svgs/f_logo.svg',
                    label: 'Continue with Facebook',
                    horizontalPadding: 90,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'or',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 15),
                  LoginField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  LoginField(
                    hintText: 'Password',
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  // BlocListener<AuthBloc, AuthState>(
                  //   listener: (context, state) {
                  //     if (state is AuthError) {
                  //       Fluttertoast.showToast(
                  //           msg: state.msg, backgroundColor: Colors.red);
                  //     }
                  //     if (state is AuthSucess) {
                  //       Fluttertoast.showToast(
                  //           msg: "Login sucessful", backgroundColor: Colors.green);
                  //     }
                  //     // TODO: implement listener
                  //   },
                  //   child:
                  GradientButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLoginRequestedEvent(
                          email: emailController.text,
                          password: passwordController.text));
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
