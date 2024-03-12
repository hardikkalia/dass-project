import 'package:cart_genie/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cart_genie/common/widgets/custom_bottom.dart';
import 'package:cart_genie/constants/global_variables.dart';

class OTPScreen extends StatefulWidget {
  static const String routeName = '/otp-screen';
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController controller = TextEditingController();

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
                  'Enter OTP',
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
                  'Enter OTP sent on your registered mobile no.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Nunito',
                    color: GlobalVariables.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: PinCodeTextField(
                    appContext: context,
                    controller: controller,
                    keyboardType: TextInputType.number,
                    length: 4,
                    obscureText: false ,
                    enableActiveFill: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      selectedFillColor: GlobalVariables.greyBackgroundColor,
                      inactiveFillColor: GlobalVariables.backgroundColor,
                      activeFillColor: GlobalVariables.backgroundColor,
                      inactiveColor: GlobalVariables.grey,
                      activeColor: Colors.black87,
                      // padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    onChanged: (value) {},
                  ),
                ),),
                const SizedBox(height: 40),
                CustomBottom(text: 'Resend OTP', onTap: (){}),
                const SizedBox(height: 100),
                CustomButton(
                key: UniqueKey(), // Add a key here to avoid any potential issues
                text: 'ENTER',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
