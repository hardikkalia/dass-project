// import 'dart:js';

import 'package:cart_genie/common/widgets/bottom_bar.dart';
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/profile/services/edit_profile_service.dart';
import 'package:cart_genie/features/profile/widgets/editprofile_text.dart';
import 'package:cart_genie/providers/user_providers.dart';
import 'package:flutter/material.dart';
import 'package:cart_genie/constants/form_validator.dart';
import 'package:cart_genie/features/profile/widgets/profile_text.dart';

import 'package:cart_genie/features/profile/widgets/profile_button.dart';
import 'package:provider/provider.dart';

enum Mode {
  saved,
  nameedit,
  mailedit,
  passwordedit,
  phoneedit,
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
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final EditProfileService editProfileService = EditProfileService();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
  }

  void editProfile() {
    if (_mode == Mode.nameedit) {
      editProfileService.editName(context: context, name: _nameController.text);
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
                padding: const EdgeInsets.only(left: 05, right: 110, top: 40),
                child: Icon(Icons.arrow_back),
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
              Container(
                height: 275,
                decoration: BoxDecoration(
                  color: GlobalVariables.greyBackgroundColor,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 40, 25, 0),
              child: Container(
                height: 600,
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
                          data: user.password,
                          icon: Icons.edit,
                          onPressed: () {
                            setState(() {
                              _mode = Mode.passwordedit;
                            });
                          },
                        ),
                      if (_mode == Mode.passwordedit)
                        EditProfileText(
                          text: 'Password',
                          controller: _passwordController,
                          hintText: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          validator: FormValidate.validatePassword,
                        ),
                      const SizedBox(height: 20),
                      if (_mode != Mode.phoneedit)
                        ProfileText(
                          text: 'Phone No.',
                          data: user.phone,
                          icon: Icons.edit,
                          onPressed: () {
                            setState(() {
                              _mode = Mode.phoneedit;
                            });
                          },
                        ),
                      if (_mode == Mode.phoneedit)
                        EditProfileText(
                          text: 'Phone No.',
                          controller: _phoneController,
                          hintText: 'Phone No.',
                          keyboardType: TextInputType.phone,
                          validator: FormValidate.validatePhoneNo,
                        ),
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
