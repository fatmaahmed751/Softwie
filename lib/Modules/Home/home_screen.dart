import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_service_text.dart';
import '../../Widgets/customer_services_card.dart';
import '../../Widgets/home_carusol_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../generated/assets.dart';
import '../Notifications/notification_screen.dart';
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
   // con.fetchBestSellerBooks();
    // con.updateItems();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingScreen(
        loading: con.loading,
        child: Column(children: [
          SizedBox(
            height: 390.h,
            child: Stack(
              children: [
                Container(
                  height: 260.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: ThemeClass.secondBackground,
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
                  top: 13,
                  left: 0,
                  right: 0,
                  child: CustomAppBarWidget.mainScreen(
                    title: "Welcome Dear ",
                     onPressed: () {
                       context.pushNamed(NotificationsScreen.routeName);
                     },

                    icon: Assets.imagesBell,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SizedBox(
                      height: 260.h,
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
                  Gap(5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomServicesTextWidget(
                          text: "Services",
                        ),
                        Gap(5.h),
                        SizedBox(
                          height: 150.h,
                          width: MediaQuery.sizeOf(context).width,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ServiceCard(
                              title: "Request Service",
                              onPressed: () {
                                con.sendRequestSuccessfully();
                              },
                            ),
                            separatorBuilder: (context, index) => Gap(16.w),
                            itemCount: 4,
                          ),
                        ),
                        Gap(15.h),
                    const CustomServicesTextWidget(
                      text: "Additional Service",
                    ),

                  Gap(15.h),
                  Wrap(
                    spacing: 20.w,
                    runSpacing: 20.h,
                    children: List.generate(10, (index) {
                      return AdditionalServiceCard(
                        title: "Development ",
                        onPressed: () {
                          con.sendRequestSuccessfully();
                        },
                      );
                    }),
                  ),
                        Gap(10.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
