import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:softwie/Modules/Notifications/notification_screen.dart';
import 'package:softwie/Modules/profile/profile_screen.dart';
import '../Modules/Home/Home_screen.dart';
import '../Modules/Register/register_screen.dart';
import '../Modules/Splash/splash_screen.dart';
import '../Modules/login/login_screen.dart';
import '../Modules/market_place/presentation/view/products_screen.dart';
BuildContext? get currentContext_ => GoRouterConfig.router.routerDelegate.navigatorKey.currentContext;
class GoRouterConfig{
  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: SplashScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const SplashScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: HomeScreen.routeName,
        path: "/${HomeScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const HomeScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: "/${LoginScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const LoginScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: RegisterScreen.routeName,
        path: "/${RegisterScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const RegisterScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ProductsScreen.routeName,
        path: "/${ProductsScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ProductsScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: NotificationsScreen.routeName,
        path: "/${NotificationsScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const NotificationsScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ProfileScreen.routeName,
        path: "/${ProfileScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ProfileScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
    ],
    // redirect: (BuildContext context, GoRouterState state) {
    //   if(!SharedPref.isLogin()) return LoginScreen.routeName;
    //   if(state.matchedLocation == LoginScreen.routeName && SharedPref.isLogin()) return "/${HomeScreen.routeName}";
    //
    //   if(state.matchedLocation == OtpScreen.routeName && state.extra == null){
    //     return ForgotPasswordScreen.routeName;
    //   }
    // },
  );

  static CustomTransitionPage getCustomTransitionPage({required GoRouterState state, required Widget child}){
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}





