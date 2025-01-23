import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../Utilities/shared_preferences.dart';
import '../../../../Utilities/text_style_helper.dart';
import '../../../../Utilities/theme_helper.dart';

class TransparentBorderButton extends StatelessWidget {
  final String text;
  final String pic;
  const TransparentBorderButton({
    super.key, required this.text, required this.pic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(
          vertical: 10.h, horizontal: 10.w),
      padding: const EdgeInsets.all(8.0),
      width: 307,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            width: 1.0,
            color: ThemeClass.of(context).labelColor.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(30.r)),
      clipBehavior: Clip.hardEdge,
      child:SharedPref.getCurrentLanguage()=="ar"?
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyleHelper.of(context).b_20.copyWith(
                color: ThemeClass.of(context).mainBlack),
          ),
          Gap(13.w),
          Image.asset(pic),
        ],
      ):
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(pic),
          Gap(13.w),
          Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyleHelper.of(context).b_20.copyWith(
              color: ThemeClass.of(context).labelColor,
            ),
          ),
          // SvgPicture.asset(pic),
        ],
      ),
    );
  }
}