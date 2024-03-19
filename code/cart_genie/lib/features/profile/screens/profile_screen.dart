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
import 'package:cart_genie/features/faq/screens/faq_screen.dart';

enum Mode {
  saved,
  nameEdit,
  mailEdit,
  passwordEdit,
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
    if (_mode == Mode.nameEdit) {
      editProfileService.editName(context: context, name: _nameController.text);
    }
    if (_mode == Mode.mailEdit) {
      editProfileService.editEmail(
          context: context, email: _emailController.text);
    }
    if (_mode == Mode.passwordEdit) {
      editProfileService.editPassword(
          context: context,
          oldPassword: _oldpasswordController.text,
          newPassword: _newpasswordController.text);
    }
  }

  Widget buildLeadingIcon() {
    if (_mode == Mode.saved) {
      return Builder(builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      });
    } else {
      return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          setState(() {
            _mode = Mode.saved;
          });
        },
      );
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
            decoration: BoxDecoration(
              color: GlobalVariables.backgroundColor,
            ),
          ),
          // centerTitle: true,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 50),
              child: Text(
              'Profile', 
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w900,
            ),
          ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: buildLeadingIcon(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: GlobalVariables.backgroundColor,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('FAQs'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Semicircle(
                radius: 325, 
                color: GlobalVariables
                    .greyBackgroundColor, 
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
                      BorderRadius.circular(15), 
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
                      if (_mode != Mode.nameEdit)
                        ProfileText(
                          text: 'Name',
                          data: user.name,
                          icon: Icons.edit,
                          colour: Colors.black,
                          onPressed: () {
                            setState(() {
                              _mode = Mode.nameEdit;
                            });
                          },
                        ),
                      if (_mode == Mode.nameEdit)
                        EditProfileText(
                          text: 'Name',
                          controller: _nameController,
                          hintText: 'Full Name',
                          keyboardType: TextInputType.name,
                          validator: FormValidate.validateName,
                        ),
                      const SizedBox(height: 20),
                      if (_mode != Mode.mailEdit)
                        ProfileText(
                          text: 'Email ID',
                          data: user.email,
                          icon: Icons.edit,
                          colour: Colors.black,
                          onPressed: () {
                            setState(() {
                              _mode = Mode.mailEdit;
                            });
                          },
                        ),
                      if (_mode == Mode.mailEdit)
                        EditProfileText(
                          text: 'Email ID',
                          controller: _emailController,
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: FormValidate.validateEmail,
                        ),
                      const SizedBox(height: 20),
                      if (_mode != Mode.passwordEdit)
                        ProfileText(
                          text: 'Password',
                          data: '********',
                          icon: Icons.edit,
                          colour: Colors.black,
                          onPressed: () {
                            setState(() {
                              _mode = Mode.passwordEdit;
                            });
                          },
                        ),
                      if (_mode == Mode.passwordEdit)
                        Column(
                          children: [
                            EditProfileText(
                              text: 'Old Password',
                              controller: _oldpasswordController,
                              hintText: 'Old Password',
                              keyboardType: TextInputType.visiblePassword,
                              validator: FormValidate.validatePassword,
                            ),
                            const SizedBox(
                                height:
                                    20),
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
