import 'package:crypto_management_task/presentation/blocs/auth/auth_bloc.dart';
import 'package:crypto_management_task/presentation/pages/home_page.dart';
import 'package:crypto_management_task/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Splash screen that determines the initial route based on authentication state.
///
/// Listens to [AuthBloc] to check if the user is authenticated and navigates to
/// either [HomePage] or [LoginPage] accordingly, providing a smooth startup experience.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: _handleAuthState,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void _handleAuthState(BuildContext context, AuthState state) {
    if (state is Authenticated) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }
}
