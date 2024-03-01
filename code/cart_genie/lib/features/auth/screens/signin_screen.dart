import 'package:cart_genie/common/widgets/custom_bottom.dart';
import 'package:cart_genie/common/widgets/custom_button.dart';
import 'package:cart_genie/common/widgets/custom_textfield.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/common/widgets/form_validator.dart';
import 'package:cart_genie/features/auth/screens/signup_screen.dart';
import 'package:flutter/material.dart';


class SignInScreen extends StatefulWidget {
  static const String routeName = '/signin-screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
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
              const Center(
                child: Text(
                'Enter your email id and password',
                style: TextStyle(
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
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: FormValidate.validateEmail,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        validator: FormValidate.validatePassword,
                      ),
                    const SizedBox(height: 50),
                    CustomButton(text: 'SIGN IN', onTap: () {
                      _signInFormKey.currentState!.validate();
                    }),
                    const SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont have an account?',
                            style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,

                          ),
                        ),
                          CustomBottom(text: 'SignUp', onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpScreen()));
                          },),
                        ],

                      )
                    )

                    ],
                  )),
              ),
              ],
            ),
          ),
        ),
    );
  }
}