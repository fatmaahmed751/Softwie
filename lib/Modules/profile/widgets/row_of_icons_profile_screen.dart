import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconsOfProfileRow extends StatelessWidget {
  const IconsOfProfileRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
              icon: const Icon(Icons.window_sharp,
              size: 30,
            ),
            // color: AppColors.containerColor,),
          ),
          IconButton(
            onPressed: () {

            },
            icon:
              Icon( Icons.web_stories,
              size: 30,
            ),
            // Icon(Icons.video_collection_sharp,
            //   color: AppColors.containerColor,  ),
          ),
          IconButton(
            onPressed: () {},
            icon:const Icon( Icons.local_airport_rounded,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
