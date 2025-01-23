import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:softwie/Modules/profile/widgets/picturs_for_profile.dart';
import 'package:softwie/Modules/profile/widgets/row_of_icons_profile_screen.dart';
import 'package:softwie/Modules/profile/widgets/row_of_profile_details.dart';
import '../../Widgets/customer_services_card.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          const BuildStackOfUserPictures(),
          Gap(10.h),
          const IconsOfProfileRow(),
          rowOfProfileDetails(context),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            child: Wrap(
              spacing: 20.w,
              runSpacing: 20.h,
              children: List.generate(10, (index) {
                return AdditionalServiceCard(
                  title: "Development ",
                  onPressed: () {
                  },
                );
              }),
            ),
          ),
        ]),
      ),
    );
  }
}
