import 'dart:io';

import 'package:flutter/material.dart';
import 'package:softwie/Modules/profile/widgets/picturs_for_profile.dart';
import 'package:softwie/Modules/profile/widgets/row_of_icons_profile_screen.dart';
import 'package:softwie/Modules/profile/widgets/row_of_profile_details.dart';
import 'package:softwie/Utilities/theme_helper.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
 // const ProfileScreenBody({super.key});
  String userName = '';
  String userProfileImage = '';
  String userBio = '';
  String userCoverImage = '';



  @override
  Widget build(BuildContext context) {
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration:  BoxDecoration(
                color: ThemeClass.of(context).secondaryBlackColor,
                gradient: LinearGradient(
                  colors:ThemeClass.backgroundGradiant,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const BuildStackOfUserPictures(),
                    const SizedBox(
                      height: 10,
                    ),
                 rowOfProfileDetails(context),
                     Divider(
                      indent: 10,
                      endIndent: 10,
                      height: 15.0,
                      // thickness: 0.3,
                      color: ThemeClass.of(context).labelColor
                    ),
                    const IconsOfProfileRow(),
                   // gridViewWidget(context),
                  ],
                ),
              ),
            ),
          );

  }





}
