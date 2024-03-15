
import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/profile/widgets/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:cart_genie/constants/form_validator.dart';
import 'package:cart_genie/features/profile/widgets/profile_text.dart';
import 'package:cart_genie/features/profile/screens/editprofile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


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
              Container(
                height: 100,
                padding: const EdgeInsets.only(left:35,top:40),
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfileScreen()),
                    );
                  },
                ),
              )

            ],
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
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  color: GlobalVariables.backgroundColor,
                  borderRadius: BorderRadius.circular(15), // Make it round-shaped
                  border: Border.all( // Add borders
                    color: GlobalVariables.grey, // Border color
                    width: 1, // Border width
                  ),

                ),
                // child: Form(
                //   key: _profileKey,

                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      ProfileText(
                        text: 'Username',
                        data: 'Yanchui'

                      ),
                      const SizedBox(height: 20),
                      ProfileText(
                        text: 'Email ID',
                        data: 'yanchui@gmail.com',

                      ),
                      const SizedBox(height: 20),
                      ProfileText(
                        text: 'Password',
                        data: 'evFTbyVVCd'

                      ),
                      const SizedBox(height: 20),
                      ProfileText(
                        text: 'Phone No.',
                        data: '9878889991',

                      ),

                    ],


                  ),
                ),
              ),

            ),


        ],
      ),

    );


  }
}
