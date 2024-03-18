// import 'dart:js';

import 'package:cart_genie/common/widgets/bottom_bar.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/profile/services/profile_service.dart';
import 'package:cart_genie/features/profile/widgets/editprofile_text.dart';
import 'package:cart_genie/providers/user_providers.dart';
import 'package:flutter/material.dart';
import 'package:cart_genie/constants/form_validator.dart';
import 'package:cart_genie/features/profile/widgets/profile_text.dart';
import 'package:cart_genie/common/widgets/background.dart';
import 'package:cart_genie/features/profile/widgets/profile_button.dart';
import 'package:provider/provider.dart';

enum Mode {
  saved,
  nameedit,
  mailedit,
  passwordedit,
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Mode _mode = Mode.saved;
  final _editprofileKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _oldpasswordController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();

  final EditProfileService editProfileService = EditProfileService();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _oldpasswordController.dispose();
    _newpasswordController.dispose();
    // _phoneController.dispose();
  }

  void editProfile() {
    if (_mode == Mode.nameedit) {
      editProfileService.editName(context: context, name: _nameController.text);
    }
    if (_mode == Mode.mailedit) {
      editProfileService.editEmail(
          context: context, email: _emailController.text);
    }
    if (_mode == Mode.passwordedit) {
      editProfileService.editPassword(
          context: context,
          oldPassword: _oldpasswordController.text,
          newPassword: _newpasswordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.backgroundColor,
            ),
          ),
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.only(right: 90, top: 40),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _mode = Mode.saved;
                    });
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.only(top: 60, right: 50),
                alignment: Alignment.topLeft,
                child: Text(
                  'Profile Screen',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Inter',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Semicircle(
                radius: 325, // Adjust the height as per your requirement
                color: GlobalVariables
                    .greyBackgroundColor, // Set the color of the semicircle
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 40, 25, 0),
              child: Container(
                // height: 720,
                padding: const EdgeInsets.all(20.0),
                width: 400,
                decoration: BoxDecoration(
                  color: GlobalVariables.backgroundColor,
                  borderRadius:
                      BorderRadius.circular(15), // Make it round-shaped
                  border: Border.all(
                    // Add borders
                    color: GlobalVariables.grey, // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Form(
                  key: _editprofileKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      if (_mode != Mode.nameedit)
                        ProfileText(
                          text: 'Name',
                          data: user.name,
                          icon: Icons.edit,
                          colour: Colors.black,
                          onPressed: () {
                            setState(() {
                              _mode = Mode.nameedit;
                            });
                          },
                        ),
                      if (_mode == Mode.nameedit)
                        EditProfileText(
                          text: 'Name',
                          controller: _nameController,
                          hintText: 'Full Name',
                          keyboardType: TextInputType.name,
                          validator: FormValidate.validateName,
                        ),
                      const SizedBox(height: 20),
                      if (_mode != Mode.mailedit)
                        ProfileText(
                          text: 'Email ID',
                          data: user.email,
                          icon: Icons.edit,
                          colour: Colors.black,
                          onPressed: () {
                            setState(() {
                              _mode = Mode.mailedit;
                            });
                          },
                        ),
                      if (_mode == Mode.mailedit)
                        EditProfileText(
                          text: 'Email ID',
                          controller: _emailController,
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: FormValidate.validateEmail,
                        ),
                      const SizedBox(height: 20),
                      if (_mode != Mode.passwordedit)
                        ProfileText(
                          text: 'Password',
                          data: '********',
                          icon: Icons.edit,
                          colour: Colors.black,
                          onPressed: () {
                            setState(() {
                              _mode = Mode.passwordedit;
                            });
                          },
                        ),
                      if (_mode == Mode.passwordedit)
                        Column(
                          children: [
                            EditProfileText(
                              text: 'Old Password',
                              controller: _oldpasswordController,
                              hintText: 'Old Password',
                              keyboardType: TextInputType.visiblePassword,
                              validator: FormValidate.validatePassword,
                            ),
                            SizedBox(
                                height:
                                    20), // Provides spacing between the input fields
                            EditProfileText(
                              text: 'New Password',
                              controller: _newpasswordController,
                              hintText: 'New Password',
                              keyboardType: TextInputType.visiblePassword,
                              validator: FormValidate.validatePassword,
                            ),
                          ],
                        ),
                      const SizedBox(height: 20),

                      ProfileText(
                        text: 'Phone No.',
                        data: user.phone,
                        icon: Icons.edit,
                        colour: Colors.transparent,
                        onPressed: () {},
                      ),
                      // if (_mode == Mode.phoneedit)
                      //   EditProfileText(
                      //     text: 'Phone No.',
                      //     controller: _phoneController,
                      //     hintText: 'Phone No.',
                      //     keyboardType: TextInputType.phone,
                      //     validator: FormValidate.validatePhoneNo,
                      //   ),
                      const SizedBox(height: 80),
                      if (_mode != Mode.saved)
                        // const SizedBox(height: 80),
                        ProfileButton(
                          text: 'Update',
                          onTap: () {
                            if (_editprofileKey.currentState!.validate()) {
                              editProfile();
                              setState(() {
                                _mode = Mode.saved;
                              });
                            }
                          },
                        ),

                      if (_mode == Mode.saved)
                        ProfileButton(
                            text: 'Sign Out',
                            onTap: () {
                              editProfileService.signOut(context: context);
                            }),
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
