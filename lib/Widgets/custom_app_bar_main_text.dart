
import 'package:flutter/material.dart';

import '../Utilities/text_style_helper.dart';

class CustomAppBarMainTextWidget extends StatelessWidget{
  final String text;
  const CustomAppBarMainTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return   ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [

            Color.fromRGBO(255, 255, 255, 1),
            Color.fromRGBO(255, 255, 255, 0.38),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcIn,
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyleHelper.of(context)
            .h_30
            .copyWith(color: Colors.white),
      ),
    );
  }

}
