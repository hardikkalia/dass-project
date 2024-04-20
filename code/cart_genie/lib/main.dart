import 'package:cart_genie/common/widgets/bottom_bar.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/auth/screens/signup_screen.dart';
import 'package:cart_genie/features/auth/services/signin_service.dart';
import 'package:cart_genie/providers/user_providers.dart';
import 'package:cart_genie/router.dart';
import 'package:cart_genie/scraping/scrape_messages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(MultiProvider(providers: [
  //   ChangeNotifierProvider(
  //     create: (context) => UserProvider(),
  //   ),
  // ], child: const MyApp()));
  runApp(MaterialApp(
    home: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _dataFetched = false;
  final SignInService signInService = SignInService();
  final SmsReaderService smsReaderService = SmsReaderService();

  @override
  void initState() {
    super.initState();
    getUserData(context);
    // smsReaderService.checkPermissionsAndReadSms(context);
  }

  Future<void> getUserData(BuildContext context) async {
    await signInService.getUserData(context);
    setState(() {
      _dataFetched = true;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // getUserData(context);
    if (!_dataFetched) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Or any other loading widget
        ),
      );
    } else {
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
            ? const BottomBar()
            : const SignUpScreen(),
      );
    }
  }
}
