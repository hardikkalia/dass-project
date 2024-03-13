import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/auth/screens/signup_screen.dart';
import 'package:cart_genie/features/auth/services/signin_service.dart';
import 'package:cart_genie/features/home/screens/home_screen.dart';
import 'package:cart_genie/providers/user_providers.dart';
import 'package:cart_genie/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SignInService signInService = SignInService();

  @override
  void initState() {
    super.initState();
    signInService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  // State<MyApp> createState() => _MyAppState();
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart Genie',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const HomeScreen()
          : const SignUpScreen(),
    );
  }
}
