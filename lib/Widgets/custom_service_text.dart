import 'package:flutter/material.dart';

import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';

class CustomServicesTextWidget extends StatelessWidget{
  final String text;
  const CustomServicesTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyleHelper.of(context).h_24.copyWith(
          color: ThemeClass.of(context).mainBlack,
          fontWeight: FontWeight.w700
      ),
    );
  }

}