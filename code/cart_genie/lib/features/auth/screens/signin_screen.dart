import 'package:cart_genie/common/widgets/custom_bottom.dart';
import 'package:cart_genie/common/widgets/custom_button.dart';
import 'package:cart_genie/common/widgets/custom_textfield.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/constants/form_validator.dart';
import 'package:cart_genie/features/auth/screens/otp_screen.dart';
import 'package:cart_genie/features/auth/screens/signup_screen.dart';
import 'package:cart_genie/features/auth/services/signin_service.dart';
import 'package:cart_genie/common/widgets/custom_hidefield.dart';
import 'package:flutter/material.dart';

enum Mode {
  email,
  phone,
}

class SignInScreen extends StatefulWidget {
  static const String routeName = '/signin-screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Mode _mode = Mode.email;
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final SignInService signInService = SignInService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
  }

  void signInUser() {
    if (_mode == Mode.email) {
      signInService.signInUserEmail(
          context: context,
          email: _emailController.text,
          password: _passwordController.text);
    } else {
      signInService.signInUserPhone(
          context: context, phone: _phoneController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Inter',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  _mode == Mode.email
                      ? 'Enter your email id and password'
                      : 'Enter your phone number',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Nunito',
                    color: GlobalVariables.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      if (_mode == Mode.email)
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: FormValidate.validateEmail,
                        ),
                      if (_mode == Mode.email) const SizedBox(height: 20),
                      if (_mode == Mode.email)
                        CustomHideField(
                          controller: _passwordController,
                          hintText: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          validator: FormValidate.validatePassword,
                        ),
                      if (_mode == Mode.phone)
                        CustomTextField(
                          controller: _phoneController,
                          hintText: 'Phone No',
                          keyboardType: TextInputType.phone,
                          validator: FormValidate.validatePhoneNo,
                        ),
                      const SizedBox(height: 50),
                      CustomButton(
                          text: 'SIGN IN',
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          }),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Dont have an account?',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CustomBottom(
                              text: 'Sign Up',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _mode == Mode.email
                                  ? 'Sign in using phone numbere instead?'
                                  : 'Sign in using email instead?',
                              style: const TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CustomBottom(
                              text: 'Click here',
                              onTap: () {
                                setState(() {
                                  if (_mode == Mode.email) {
                                    _mode = Mode.phone;
                                  } else {
                                    _mode = Mode.email;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
