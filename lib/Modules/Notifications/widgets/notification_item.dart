
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/theme_helper.dart';
import '../notifications_controller.dart';

class CustomNotificationItemWidget extends StatefulWidget {
  const CustomNotificationItemWidget({
    super.key,
  });

  @override
  createState() => CustomNotificationItemWidgetState();
}

class CustomNotificationItemWidgetState extends StateMVC<CustomNotificationItemWidget> {
  CustomNotificationItemWidgetState() : super(NotificationsController()) {
    con = NotificationsController();
  }

  late NotificationsController con;
  bool isRead = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: 5.h),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: ThemeClass.of(context).primaryColor.withOpacity(0.2)),
              // color: ThemeClass.of(context).background.withOpacity(0.20),
              borderRadius: BorderRadius.circular(30.r)),
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 16.w, vertical: 3.h),
            child: Text(
                "Your services is already exist You can now track your production and services You can now track your production and services",
                style: TextStyleHelper.of(context).b_16.copyWith(
                    height:2.4,
                    color: ThemeClass.of(context).secondaryBlackColor
                )

            ),
          ),
        ),
      ),
    );
  }
}
