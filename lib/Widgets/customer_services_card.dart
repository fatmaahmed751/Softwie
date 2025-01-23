import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:softwie/Modules/market_place/presentation/view/products_screen.dart';
import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsetsDirectional.symmetric(horizontal: 3.w,vertical: 8.h),
      child: Container(
        width: 158.w,
        height: 150.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
                color:Colors.purple.withOpacity(0.20),
                offset: const Offset(2,2),
                blurStyle: BlurStyle.outer,
                blurRadius:3,
                spreadRadius:3
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyleHelper.of(context).h_16.copyWith(
                    color:ThemeClass.of(context).primaryColor)
            ),
            Gap(10.h),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor:ThemeClass.of(context).mainSecondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Text(
                  "Request Service",
                  style: TextStyleHelper.of(context).h_12.copyWith(
                      color: ThemeClass.of(context).background
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdditionalServiceCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AdditionalServiceCard({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pushNamed(ProductsScreen.routeName);
      },
      child: Container(
        width: 160.w,
        height: 156.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
                color:Colors.purple.withOpacity(0.20),
                offset: const Offset(2,2),
                blurStyle: BlurStyle.outer,
                blurRadius:3,
                spreadRadius:3
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyleHelper.of(context).h_16.copyWith(
                    color:ThemeClass.of(context).primaryColor)
            ),
            Gap(10.h),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor:ThemeClass.of(context).mainSecondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Text(
                 "Request Service",
                  style: TextStyleHelper.of(context).h_12.copyWith(
                      color: ThemeClass.of(context).background
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}