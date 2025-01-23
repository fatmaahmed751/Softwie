import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../Modules/Notifications/notification_screen.dart';
import '../Modules/profile/profile_screen.dart';
import '../Utilities/shared_preferences.dart';
import '../Utilities/theme_helper.dart';
import '../generated/assets.dart';
import 'custom_app_bar_main_text.dart';
import 'custom_gradient_text.dart';

enum _AppBarType { main, mainDetails, details,secondary,secondaryGradient }

//
class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final _AppBarType _appBarType;
  final String screenName;
  final List<Widget>? actions;
  final String title;
  final String icon;
  final void Function()? onPressed;
//
  const CustomAppBarWidget.mainScreen(

      // final void Function()? onPressed,
          {Key? key,
        this.onPressed,
        required this.title,
        required this.icon,
        this.actions})
      : _appBarType = _AppBarType.main,
        screenName = title,
  //actions = const [],
        super(key: key);
//
  const CustomAppBarWidget.detailsScreen({
    Key? key,
    required this.title,
    required this.icon,
    this.actions,
    this.onPressed,
  })  : _appBarType = _AppBarType.mainDetails,
        screenName = title,
        super(key: key);
//
  const CustomAppBarWidget.secondaryGradient({
    Key? key,
    required this.title,
    this.onPressed, required this.icon,
  })  : _appBarType = _AppBarType.secondaryGradient,
        screenName = title,
        actions = const [],
        super(key: key);

  const CustomAppBarWidget.gradientDetails({
    Key? key,
    required this.title,
    required this.icon,
    this.onPressed,
  })  : _appBarType = _AppBarType.details,
        screenName = title,
        actions = const [],
        super(key: key);

  const CustomAppBarWidget.secondaryAppBar({
    Key? key,
    required this.title,
    required this.icon,

    this.onPressed, this.actions,
  })  : _appBarType = _AppBarType.secondary,
        screenName = title,


        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (_appBarType) {
      case _AppBarType.main:
        return MainAppBarWidget(
            title: screenName, onPressed: onPressed, icon: icon, actions: []
          //  () {  },
        );
      case _AppBarType.secondaryGradient:
        return SecondaryGradientAppBarWidget(
          title: screenName,
          //  () {  },
        );
      case _AppBarType.mainDetails:
        return MainDetailsAppBarWidget(
          title: screenName,
          onPressed: onPressed,
          icon: icon,
          actions: actions,
        );
      case _AppBarType.details:
        return GradientAppBarWidget(
          title: screenName,
          onPressed: onPressed,
          icon: icon,
        );
      case _AppBarType.secondary:
        return SecondaryAppBarWidget(
          title: screenName,
          icon: icon,
        );
      default:
        return Container();
    }
  }

//
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 1.h);
// }
}

class MainAppBarWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final String icon;
  final List<Widget>? actions;
  const MainAppBarWidget(
      {Key? key,
        required this.title,
        required this.icon,
        required this.onPressed,
        this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 10.w, top: 50.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Transform.flip(
          //   flipX: SharedPref.getCurrentLanguage() == "ar" ? true : false,
          //   child: IconButton(
          //       icon: SvgPicture.asset(""),
          //       onPressed: onPressed),
          // ),
         CustomAppBarMainTextWidget(text: title),
          const Spacer(),
          GestureDetector(
              onTap: (){
           context.pushNamed(NotificationsScreen.routeName);
              },
              child: Image.asset(icon,height: 25,
              color: Colors.white70,)),
          Gap(5.w),
          GestureDetector(
              onTap: (){
                context.pushNamed(ProfileScreen.routeName);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(Assets.imagesUser,height: 28,
                  color: Colors.white70,  ),
              )),
          Gap(20.w)
        ],
      ),
    );
  }
}

class MainDetailsAppBarWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final String? icon;
  final List<Widget>? actions;
  const MainDetailsAppBarWidget(
      {Key? key,
        required this.title,
        this.icon,
        required this.onPressed,
        this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 10.w, top: 50.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              icon: SvgPicture.asset(""), onPressed: onPressed),
          Gap(10.w),
          //CustomAppBarMainTextWidget(text: title),
//Gap(20.w),
          const Spacer(),
          IconButton(
              icon: SvgPicture.asset(icon!),
              onPressed: () {
              //  context.pushNamed(MediaScreen.routeName);
              }),

        ],
      ),
    );
  }
}

class SecondaryAppBarWidget extends StatelessWidget {
  final String title;
  final String? icon;
  // final VoidCallback? onDeleteIconToggle;
  const SecondaryAppBarWidget({
    Key? key,
    required this.title,
    this.icon,
    //this.onDeleteIconToggle

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('SecondaryAppBarWidget rebuild with icon: ${widget.icon}');
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 10.w, top: 50.h),
      child: Container(
        // color: Colors.red,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(5.w),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor:
                ThemeClass.of(context).background.withOpacity(0.20),
                child: Transform.flip(
                  flipX: SharedPref.getCurrentLanguage() == "ar" ? true : false,
                  child: Icon(Icons.arrow_back_ios_rounded,
                  color: ThemeClass.of(context).secondaryBlackColor,)
                ),
              ),
            ),
            Gap(90.w),
          //  Center(child: CustomAppBarMainTextWidget(text:title),
        ]
            ),



              ),




    );
  }
}

class SecondaryGradientAppBarWidget extends StatelessWidget {
  final String title;
  const SecondaryGradientAppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 10.w, top: 50.h),
      child: Container(
        // color: Colors.red,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(5.w),
            InkWell(
              onTap: () {
                context.pop();
              },
              child: CircleAvatar(
                radius: 18.r,
                // backgroundColor:
                // ThemeClass.of(context).blueColor,
                // child:  Transform.flip(
                //   flipX: SharedPref.getCurrentLanguage() == "ar" ? true : false,
                //   child: SvgPicture.asset(
                //     Assets.imagesDarkArrowBack,
                //   ),
                // ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom:8.h),
              child: Center(child: CustomGradientTextWidget(text: title)),

            ),
            Gap(50.w),
            Spacer()

          ],
        ),
      ),
    );
  }
}
class GradientAppBarWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final String? icon;

  const GradientAppBarWidget({
    Key? key,
    required this.title,
    this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 10.w, top:46.h),
      child: Container(
        //color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(icon: SvgPicture.asset(icon!), onPressed: onPressed),
            Gap(80.w),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom:12.h),
              child: Expanded(child: Center(child: CustomGradientTextWidget(text: title))),
            ),
            const Spacer(),

          ],
        ),
      ),
    );
  }
}