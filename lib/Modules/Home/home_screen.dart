import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/theme_helper.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/home_carusol_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../generated/assets.dart';
import '../Best_seller/widgets/best_seller_list.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  _HomeScreenState() : super(HomeController()) {
    con = HomeController();
  }
  late HomeController con;

  @override
  void initState() {
    super.initState();
    con.fetchBestSellerBooks();
    // con.updateItems();
  }

  void toggleDrawer() {
    if (con.scaffoldKey.currentState!.isDrawerOpen) {
      Navigator.of(context).pop(); // Close the drawer
    } else {
      con.scaffoldKey.currentState!.openDrawer(); // Open the drawer
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // key: con.scaffoldKey,
      // drawer: CustomDrawerWidget(
      //   initialIndex:con.selectedIndex,
      //   items: con.items,
      //   routes:con.routes,
      // ),
      body: LoadingScreen(
        loading: con.loading,
        child: Column(
          children: [
            SizedBox(
              height: 390.h,
              child: Stack(
                children: [
                  Container(
                    height: 280.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: ThemeClass.backgroundGradiant,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CustomAppBarWidget.mainScreen(
                      title: "Welcome ",
                      icon: Assets.imagesBell,
                      onPressed: toggleDrawer,
                    ),
                  ),
                  Positioned(
                    bottom: -1, // Overlapping with the next section
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SizedBox(
                        height: 248.h,
                        child: HomeCarouselWidget(
                          carouselItems: con.carouselData,
                          activeIndex: con.activeIndex,
                          onPageChange: (index) {
                            setState(() {
                              con.activeIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(15.h),
                    BestSellerList(books: con.bestSellerBooks),
                    Gap(15.h),
                    Gap(10.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
