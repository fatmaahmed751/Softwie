
import 'package:softwie/Modules/Splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Utilities/theme_helper.dart';
import '../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends StateMVC<SplashScreen> {
  _SplashScreenState() : super(SplashController()) {
    con = SplashController();
  }

  late SplashController con;


  @override
  void initState() {
    con.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        decoration: BoxDecoration(
        gradient:   LinearGradient(
            colors:ThemeClass.secondBackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        width:double.infinity ,
        height:double.infinity ,
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: 24.w, vertical: 20.h),
          child:Image.asset(Assets.imagesSoftwie, width: 400.w, height:480.h,
        ),
        ),
      )
    );
  }
}

