import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softwie/Widgets/custom_side_text_widget.dart';

Widget rowOfProfileDetails(context)=>
   SizedBox(
     height: 100.h,
          width: double.infinity,
          child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Column(
            children: [
              CustomSideTextWidget(
                text: '250k',
              ),
              CustomSideTextWidget(
                text: 'Like',
              ),
            ],
          ),
          Column(
            children: [
              CustomSideTextWidget(
                text: '250k',
              ),
              CustomSideTextWidget(
                text: 'Post',
              ),
            ],
          ),
          Column(
            children: [
              CustomSideTextWidget(
                text: '250k',
              ),
              CustomSideTextWidget(
                text: 'Reel',
              ),
            ],
          ),

        ],
          ),
        );

