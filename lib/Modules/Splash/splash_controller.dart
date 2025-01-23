import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:softwie/Modules/Splash/splash_data_handler.dart';
import '../../Utilities/shared_preferences.dart';
import '../Home/Home_screen.dart';
import '../login/login_screen.dart';

class SplashController extends ControllerMVC {
  // singleton
  factory SplashController() {
    _this ??= SplashController._();
    return _this!;
  }
  static SplashController? _this;
  SplashController._();



  Future init(BuildContext context)async{
    await SplashDataHandler.getCurrentUser();
    await Future.delayed(const Duration(seconds: 5));
    if(context.mounted) {
     GoRouter.of(context).pushNamed(HomeScreen.routeName);
      if(SharedPref.isLogin()){
        // GoRouter.of(context).goNamed(HomeScreen.routeName);
      }else{
        // GoRouter.of(context).go(LoginScreen.routeName);
      }
    }
  }
}
