import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cart_genie/common/widgets/custom_bottom.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/auth/services/signin_service.dart';
import 'package:cart_genie/features/auth/services/signup_service.dart';
import 'package:cart_genie/common/widgets/custom_button.dart';

class OTPScreen extends StatefulWidget {
  static const String routeName = '/otp-screen';
  final String phone;
  final String email;
  final String password;
  final bool signup;
  final String name;

  const OTPScreen({
    super.key,
    required this.phone,
    this.email = '',
    this.password = '',
    this.signup = false,
    this.name = '',
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController controller = TextEditingController();
  SignInService signInService = SignInService();
  SignUpService signUpService = SignUpService();

  void sendOTP() {
    if (widget.signup) {
      signUpService.sendOTP(
        context: context,
        phone: widget.phone,
        code: controller.text,
        email: widget.email,
        name: widget.name,
        password: widget.password,
      );
    } else {
      signInService.sendOTP(
        context: context,
        phone: widget.phone,
        code: controller.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.height * 0.1),
              Center(
                child: Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.1,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.05),
              Center(
                child: Text(
                  'Enter OTP sent on your registered mobile no.',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.025,
                    fontFamily: 'Nunito',
                    color: GlobalVariables.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.1),
              PinCodeTextField(
                appContext: context,
                controller: controller,
                keyboardType: TextInputType.number,
                length: 4,
                obscureText: false,
                enableActiveFill: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: screenSize.width * 0.15,
                  fieldWidth: screenSize.width * 0.15,
                  selectedFillColor: GlobalVariables.greyBackgroundColor,
                  inactiveFillColor: GlobalVariables.backgroundColor,
                  activeFillColor: GlobalVariables.backgroundColor,
                  inactiveColor: GlobalVariables.grey,
                  activeColor: Colors.black87,
                ),
                onChanged: (value) {},
              ),
              SizedBox(height: screenSize.height * 0.05),
              CustomBottom(text: 'Resend OTP', onTap: () {}),
              SizedBox(height: screenSize.height * 0.1),
              CustomButton(
                key: UniqueKey(),
                text: 'ENTER',
                onTap: () {
                  sendOTP();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
