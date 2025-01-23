import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softwie/Modules/Register/widgets/register_body.dart';

import '../login/data/repos/login_and_register_repo_impl.dart';
import 'manager/register_cubit.dart';
class RegisterScreen extends StatelessWidget {
  static const routeName = "register";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => UserRegisterCubit(LoginAndRegisterRepoImplement())..getUserRegisterData(),// Provide the UserRegisterCubit
      child: const RegisterScreenBody(),
    );

  }
}