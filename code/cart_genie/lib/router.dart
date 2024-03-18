import 'package:cart_genie/common/widgets/bottom_bar.dart';
import 'package:cart_genie/features/auth/screens/signin_screen.dart';
import 'package:cart_genie/features/auth/screens/signup_screen.dart';
import 'package:cart_genie/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpScreen(),
      );
    case SignInScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignInScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist'),
          ),
        ),
      );
  }
}
