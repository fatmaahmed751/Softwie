import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:softwie/Modules/Notifications/widgets/notification_item.dart';
import '../../../Utilities/strings.dart';
import '../../../Widgets/custom_app_bar_widget.dart';
import '../../../Widgets/loading_screen.dart';
import '../../Utilities/theme_helper.dart';
import 'notifications_controller.dart';

class NotificationsScreen extends StatefulWidget {
  static const routeName = "Notifications";


  const NotificationsScreen({
    super.key,
  });

  @override
  createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends StateMVC<NotificationsScreen> {
  _NotificationsScreenState() : super(NotificationsController()) {
    con = NotificationsController();
  }
  late NotificationsController con;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
      appBar: CustomAppBarWidget.secondaryAppBar(
        title:"Notifications",
        icon: "",
      ),
      body: LoadingScreen(
        loading: con.loading,
        child: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: ThemeClass.backgroundGradiant,
          //     begin: Alignment.bottomRight,
          //    // end: Alignment.topCenter,
          //   ),

          child: SafeArea(
            child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 19.w,vertical: 25.h),
                child:
                ListView.separated(
                    itemBuilder:(context,index) =>
                    const CustomNotificationItemWidget(),
                    separatorBuilder:(context,index)=> Gap(16.h),
                    itemCount:5 )

            ),
          ),
        ),
      ),
    );
  }
}
