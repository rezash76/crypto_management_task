import 'package:crypto_management_task/core/di/injection.dart';
import 'package:crypto_management_task/presentation/blocs/app_them/app_theme_cubit.dart';
import 'package:crypto_management_task/presentation/blocs/auth/auth_bloc.dart';
import 'package:crypto_management_task/presentation/blocs/coin/coin_cubit.dart';
import 'package:crypto_management_task/presentation/blocs/profile/profile_cubit.dart';
import 'package:crypto_management_task/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  /// Ensure that the widgets binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  /// Configure the dependencies of the application.
  configureDependencies();

  /// Run the application with the provided BLoCs.
  runApp(
    MultiBlocProvider(
      providers: [
        // The app theme Cubit is responsible for managing the theme of the
        // application.
        BlocProvider(create: (context) => sl<AppThemeCubit>()),
        // The auth BLoC is responsible for managing the authentication state of
        // the user.
        BlocProvider(
          create: (context) => sl<AuthBloc>()..add(CheckUserIsLoginStatus()),
        ),
        // The coin Cubit is responsible for managing the list of coins.
        BlocProvider(create: (context) => sl<CoinCubit>()),
        // The profile Cubit is responsible for managing the profile of the user.
        BlocProvider(create: (context) => sl<ProfileCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

/// The root widget of the application.
///
/// This widget is responsible for setting up the theme and the home page of the
/// application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Crypto Management',
          debugShowCheckedModeBanner: false,
          theme: (state as AppThemeData).themeData,
          home: const SplashPage(),
        );
      },
    );
  }
}
