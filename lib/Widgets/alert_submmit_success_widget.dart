
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../Utilities/text_style_helper.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../../generated/assets.dart';


class  AlertSummitedSuccessfully extends StatelessWidget {
  final String firstText;
  final String secondText;
  const AlertSummitedSuccessfully({super.key, required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 373.w,
        height: 540.h,
        decoration: BoxDecoration(
          color: ThemeClass
              .of(context)
              .background,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: 10.w, vertical: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesSoftwie),
              Gap(50.h),
              SizedBox(
                // width:290.w ,
                height:95.h ,
                child: Text(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  firstText,
                  style: TextStyleHelper
                      .of(context)
                      .h_24
                      .copyWith(
                    color: ThemeClass.of(context).mainBlack,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Text(secondText,
                  textAlign: TextAlign.center,
                  style: TextStyleHelper
                      .of(context)
                      .b_16
                      .copyWith(
                      decoration: TextDecoration.none,
                      color:
                      const Color(0xff899094)
                  )
              ),
              Gap(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
