import 'package:dartz/dartz.dart';

import '../../../../Models/user_login_model.dart';
import '../../../../Models/user_register_model.dart';
import '../../../../core/error/failures.dart';

abstract class LoginAndRegisterRepo {
  Future<Either<Failure, UserLoginModel>> fetchUserLoginData(
      UserLoginModel userLoginModel);

  Future<Either<Failure, UserRegisterModel>> fetchUserRegisterData(
      UserRegisterModel userRegisterModel);

  Future<UserRegisterModel> saveUserData({
      required String uId,
      required String name,
      required String image,
      required String email,
      required String coverImage
      });

  Future<Either<Failure, UserRegisterModel>> getUserData();

 Future getCoverImage();
}
