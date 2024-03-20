import 'package:cart_genie/common/widgets/custom_bottom.dart';
import 'package:cart_genie/common/widgets/custom_button.dart';
import 'package:cart_genie/common/widgets/custom_textfield.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/constants/form_validator.dart';
import 'package:cart_genie/features/auth/screens/otp_screen.dart';
import 'package:cart_genie/features/auth/screens/signin_screen.dart';
import 'package:cart_genie/features/auth/services/signup_service.dart';
import 'package:cart_genie/common/widgets/custom_hidefield.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup-screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  final _signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final SignUpService signUpService = SignUpService();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
  }

  void signUpUser() {
    signUpService.signUpUser(
      context: context,
      email: _emailController.text,
      name: _nameController.text,
      password: _passwordController.text,
      phone: _phoneController.text,
    );
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
                  'Sign Up',
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
                    'Create an account to continue',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Nunito',
                      color: GlobalVariables.grey,
                      fontWeight: FontWeight.w600,

                    )
                ),
              ),

              Container(
                padding: const EdgeInsets.all(8),
                child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Full Name',
                          keyboardType: TextInputType.name,
                          validator: FormValidate.validateName,
                          // validator: (val){},
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: FormValidate.validateEmail,

                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _phoneController,
                          hintText: 'Phone',
                          keyboardType: TextInputType.phone,
                          validator: FormValidate.validatePhoneNo,

                        ),
                        const SizedBox(height: 20),
                        CustomHideField(
                          controller: _passwordController,
                          hintText: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          validator: FormValidate.validatePassword,
                        ),


                        const SizedBox(height: 50),
                        CustomButton(
                          text: 'SIGN UP',
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUpUser();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => OTPScreen(phone: _phoneController.text,)),
                              // );
                            }
                          },
                        ),

                        const SizedBox(height: 20),
                        Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),
                                CustomBottom(text: 'Login', onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => SignInScreen()));
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


