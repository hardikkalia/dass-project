
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/profile/widgets/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:cart_genie/constants/form_validator.dart';
import 'package:cart_genie/features/profile/widgets/editprofile_text.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final _editprofileKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(preferredSize: const Size.fromHeight(70),

          child: AppBar(

            flexibleSpace:Container(
              decoration: const BoxDecoration(
                color: GlobalVariables.backgroundColor,
              ),
            ),

            title: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[

                // Container(
                //   height: 100,
                //   padding: const EdgeInsets.only(left: 05, right: 100, top: 40),
                //   child: Icon(Icons.arrow_back),
                //
                // ),
                Container(
                  height: 100,
                  padding: const EdgeInsets.only(top: 40, left: 60),
                  alignment: Alignment.topLeft,
                  child: Text(
                   'Edit Profile Screen',
                    style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Inter',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w900,
                ),
              ),
            ),],
            ),
      ),
    ),
      body: Stack(
        children:[
            Column(
              children: [
                 Container(
                   height: 275,
                   decoration:  BoxDecoration(
                     color: GlobalVariables.greyBackgroundColor,
                   ),
                 ),


              ],
            ),
              SingleChildScrollView(
                child:

                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 40, 25, 0),
                  child: Container(
                    height: 650,
                    decoration: BoxDecoration(
                      color: GlobalVariables.backgroundColor,
                      borderRadius: BorderRadius.circular(15), // Make it round-shaped
                      border: Border.all( // Add borders
                      color: GlobalVariables.grey, // Border color
                      width: 1, // Border width
                    ),

                  ),
                    child: Form(
                      key: _editprofileKey,

                      child: Column(
                      children: [
                        const SizedBox(height: 20),
                        EditProfileText(
                          text: 'Username',
                          controller: _nameController,
                          hintText: 'Full Name',
                          keyboardType: TextInputType.name,
                          validator: FormValidate.validateName,
                        ),
                        const SizedBox(height: 20),
                        EditProfileText(
                          text: 'Email ID',
                          controller: _emailController,
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: FormValidate.validateEmail,
                        ),
                        const SizedBox(height: 20),
                        EditProfileText(
                          text: 'Password',
                          controller: _passwordController,
                          hintText: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          validator: FormValidate.validatePassword,
                        ),
                        const SizedBox(height: 20),
                        EditProfileText(
                          text: 'Phone No.',
                          controller: _phoneController,
                          hintText: 'Phone No.',
                          keyboardType: TextInputType.phone ,
                          validator: FormValidate.validatePhoneNo,
                        ),

                            const SizedBox(height: 20),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 650, left: 25),
                            ProfileButton(
                            text: 'Update',
                            onTap: () {
                            _editprofileKey.currentState!.validate();
                            },
                          ),


                      ],


                        ),
                    ),
                    ),

                  ),
                  ),

        ],
      ),

    );


  }
}
