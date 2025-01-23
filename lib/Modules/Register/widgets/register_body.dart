import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:softwie/Modules/Home/Home_screen.dart';

import '../../../Models/user_register_model.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Utilities/validate.dart';
import '../../../Widgets/custom_button_widget.dart';
import '../../../Widgets/custom_raw_user_status.dart';
import '../../../Widgets/custom_side_text_widget.dart';
import '../../../Widgets/custom_text_field.dart';
import '../../../Widgets/transparent_button_widget.dart';
import '../../../generated/assets.dart';
import '../manager/register_cubit.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({
    super.key,
  });

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {

  UserRegisterModel? registerModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPassword = true;
  bool loading = false, autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    UserRegisterCubit cubit = UserRegisterCubit.get(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        // height: 770,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ThemeClass.backgroundGradiant,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
              child: ListView(
                children: [
                  Gap(15.h),
                  Image.asset(
                    Assets.imagesSoftwie,
                    height: 120,
                  ),
                  Gap(20.h),
                  Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyleHelper.of(context)
                          .h_24
                          .copyWith(color: ThemeClass.of(context).background),
                    ),
                  ),
                  const CustomSideTextWidget(text: "email"),
                  Gap(10.h),
                  CustomTextFieldWidget(
                    height: 55.h,
                    hint: "enterEmail",
                    hintStyle: TextStyle(
                      color: ThemeClass.of(context).secondaryBlackColor,
                    ),
                    prefixIcon: Image.asset(
                      Assets.imagesEmail,
                      height: 28.h,
                      width: 25.w,
                    ),
                    isDense: true,
                    insidePadding: EdgeInsets.symmetric(vertical: 15.h),
                    backGroundColor: ThemeClass.of(context).background,
                    controller: emailController,
                    validator: (v) => Validate.validateEmail(v),
                  ),
                  Gap(10.h),
                  const CustomSideTextWidget(text: "Password"),
                  Gap(8.h),
                  CustomTextFieldWidget(
                    height: 60.h,
                    obscure: isPassword,
                    hint: "enterPassword",
                    hintStyle: TextStyle(
                      color: ThemeClass.of(context).secondaryBlackColor,
                    ),
                    prefixIcon: Image.asset(Assets.imagesLock,
                        height: 35.h, width: 25.w),
                    suffixIcon: isPassword
                        ? Image.asset(Assets.imagesHide)
                        : Image.asset(Assets.imagesSee),
                    onSuffixTap: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    isDense: true,
                    insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                    backGroundColor: ThemeClass.of(context).background,
                    controller: confirmPasswordController,
                    validator: (v) => Validate.validatePassword(v),
                  ),
                  const CustomSideTextWidget(text: "Repeat Password"),
                  Gap(8.h),
                  CustomTextFieldWidget(
                    height: 60.h,
                    obscure: isPassword,
                    hint: "Repeat Password",
                    hintStyle: TextStyle(
                      color: ThemeClass.of(context).secondaryBlackColor,
                    ),
                    prefixIcon: Image.asset(Assets.imagesLock,
                        height: 35.h, width: 25.w),
                    suffixIcon: isPassword
                        ? Image.asset(Assets.imagesHide)
                        : Image.asset(Assets.imagesSee),
                    onSuffixTap: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    isDense: true,
                    insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                    backGroundColor: ThemeClass.of(context).background,
                    controller: passwordController,
                    validator: (v) => Validate.validatePassword(v),
                  ),
                  Gap(16.h),
                  CustomButtonWidget.primary(
                    height: 55.h,
                    radius: 50.r,
                    title: "Sign Up",
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        registerModel = UserRegisterModel(
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                        );
                        print('Register Model: $registerModel');
                        cubit.getUserData(registerModel!);
                        print(registerModel!.email);
                        GoRouter.of(context).pushNamed(HomeScreen.routeName);
                      } else {
                        setState(() {
                          autoValidate = true;
                        });
                      }
                    },
                  ),
                  UserStatusRow(
                    text: "I Have an Account?",
                    nextText: "Login",
                    onNextTextTap: () {
                      context.pushNamed(HomeScreen.routeName);
                    },
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Color(0xffCDC5BF),
                          thickness: 1.0,
                        ),
                      ),
                      Gap(8.w),
                      Text(
                        "or",
                        style: TextStyleHelper.of(context).b_16,
                      ),
                      Gap(8.w),
                      const Expanded(
                        child: Divider(
                          color: Color(0xffCDC5BF),
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                      },
                      child: const TransparentBorderButton(
                        text: "continueUsingGoogle",
                        pic: Assets.imagesGoogleIcon,
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                      },
                      child: const TransparentBorderButton(
                        text: "continueUsingApple",
                        pic: Assets.imagesAppleImage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
