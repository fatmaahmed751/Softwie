import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:softwie/Modules/Home/home_screen.dart';

import '../../../Models/user_login_model.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Utilities/validate.dart';
import '../../../Widgets/custom_button_widget.dart';
import '../../../Widgets/custom_raw_user_status.dart';
import '../../../Widgets/custom_side_text_widget.dart';
import '../../../Widgets/custom_text_field.dart';
import '../../../Widgets/transparent_button_widget.dart';
import '../../../generated/assets.dart';
import '../../Register/register_screen.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({
    super.key,
  });

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  bool loading = false, autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isPassword = true;
  UserLoginModel? model;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // UserLoginCubit cubit = UserLoginCubit.get(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 760,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ThemeClass.backgroundGradiant,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
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
                    Gap(20.h),
                    Center(
                      child: Text(
                        "Login",
                        style: TextStyleHelper.of(context).h_24.copyWith(
                            fontSize: 25,
                            color: ThemeClass.of(context).background),
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
                      controller: passwordController,
                      validator: (v) => Validate.validatePassword(v),
                    ),
                    Gap(16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                          },
                          child: Text(
                            "forgetPassword ?",
                            textAlign: TextAlign.left,
                            style: TextStyleHelper.of(context).b_16.copyWith(
                                color: ThemeClass.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                    Gap(10.h),
                    CustomButtonWidget.primary(
                      height: 55.h,
                      radius: 50.r,
                      title: "Login",
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          model= UserLoginModel(
                            email:emailController.text,
                            password: passwordController.text,

                          );
                          print(model!.email);
                          GoRouter.of(context).pushNamed(HomeScreen.routeName);
                        } else {
                          setState(() {
                            autoValidate = true;
                          });
                        }
                      },
                    ),
                    Gap(10.h),
                    UserStatusRow(
                      text: "Create Account?",
                      nextText: "sign Up",
                      onNextTextTap: () {
                        context.pushNamed(RegisterScreen.routeName);
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
                          pic: Assets.imagesGoogle,
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          //con.loginByGmail(context);
                        },
                        child: const TransparentBorderButton(
                          text: "continueUsingApple",
                          pic: Assets.imagesGoogle,
                        ),
                      ),
                    ),
                    Gap(50.h),
                    Image.asset(
                      Assets.imagesSoftwie,
                      height: 130.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
