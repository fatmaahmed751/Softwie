
import 'package:flutter/material.dart';

import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';

class CustomGradientTextWidget extends StatelessWidget{
  final String text;
  const CustomGradientTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return  LinearGradient(
            colors:ThemeClass.textGradientColor,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcIn,
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: TextStyleHelper.of(context)
              .h_24
              .copyWith(color: ThemeClass.of(context).background),
        ),
      ),
    );
  }

}
