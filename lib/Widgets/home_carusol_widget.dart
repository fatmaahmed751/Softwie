import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../Utilities/theme_helper.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Widgets/custom_network_image.dart';

class HomeCarouselWidget extends StatefulWidget {
  final int activeIndex;
  final Function(int index) onPageChange;
  final List<CarouselData> carouselItems;
  const HomeCarouselWidget({
    super.key,
    required this.activeIndex,
    required this.onPageChange,
    required this.carouselItems,
  });

  @override
  State<HomeCarouselWidget> createState() =>
      _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.carouselItems.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final item = widget.carouselItems[index];
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 382.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Stack(
                    children: [
                      // Display Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: CustomNetworkImage(
                          height: 270.h,
                          width: 382.w,
                          url: item.imagePath,
                          radius: 20.r,
                        ),
                      ),
                      Container(
                        height: 270.h,
                        width: 382.w,
                        decoration: BoxDecoration(
                          color: Colors.transparent,

                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 8.w, vertical: 15.h),
                        child: Column(
                          children: [
                            // Title
                            Text(
                              item.title,
                              style: TextStyleHelper.of(context).h_20.copyWith(
                                  color: ThemeClass.of(context).background),
                              textAlign: item.textAlign,
                            ),
                            Gap(5.h),
                            // Subtitle
                            Text(
                              item.subtitle,
                              style: TextStyleHelper.of(context).b_16.copyWith(
                                  color: ThemeClass.of(context).background),
                              textAlign: item.textAlign,
                            ),
                            Gap(5.h),
                            // Button
                            // CustomRequestButtonWidget(
                            //   text: item.buttonText,
                            //   onTap: item.onButtonPressed,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            initialPage: 0,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            height: 207.h,
            onPageChanged: (index, reason) {
              setState(() {
                _activeIndex = index;
              });
              widget.onPageChange(index);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: AnimatedSmoothIndicator(
            effect: ExpandingDotsEffect(
              dotWidth: 10.r,
              activeDotColor: const Color(0xFF7E57C2),
              dotHeight: 10.r,
            ),
            activeIndex: _activeIndex,
            count: widget.carouselItems.length,
          ),
        )
      ],
    );
  }
}

class CarouselData {
  final String imagePath;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final TextAlign textAlign;

  CarouselData({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onButtonPressed,
    this.textAlign = TextAlign.center,
  });
}