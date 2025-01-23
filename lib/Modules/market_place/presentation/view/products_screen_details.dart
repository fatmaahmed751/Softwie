import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:softwie/Modules/market_place/presentation/view/search_products.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../../Widgets/custom_app_bar_main_text.dart';
import '../../../../generated/assets.dart';
import 'grid_view_widget.dart';

class ProductsScreenDetails extends StatelessWidget {
  const ProductsScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration:  BoxDecoration(
          color: ThemeClass.of(context).background,
          gradient: LinearGradient(
            colors: ThemeClass.backgroundGradiant,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child:  Padding(
          padding:  EdgeInsets.only(left:9.0,right:9.w,top:10,),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Gap(5.h),
              Row(
                children: [
                  const CustomAppBarMainTextWidget(
                      text: 'MarketPlace',
                     ),
                const Spacer(),
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white70,
                    size: 25,
                  ),

                  IconButton(
                    onPressed: (){},
                    icon:   Image.asset(Assets.imagesBell,
                      height: 25,
                    color: Colors.white70,))
                ],
              ),
              const SizedBox(height:10),
              const SearchProducts(),
              Gap(20.h),
              const GridViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
