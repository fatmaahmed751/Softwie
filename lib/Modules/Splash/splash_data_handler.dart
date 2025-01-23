import 'package:dartz/dartz.dart';
import 'package:softwie/Models/user_login_model.dart';
import '../../Utilities/api_end_point.dart';
import '../../core/API/generic_request.dart';
import '../../core/API/request_method.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';

class SplashDataHandler{
  static Future<Either<Failure,UserLoginModel>> getCurrentUser()async{
    try {
      UserLoginModel response = await GenericRequest<UserLoginModel>(
        method: RequestApi.get(url: APIEndPoint.test),
        fromMap: UserLoginModel.formJson,
      ).getObject();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.toString(), errorMessage: failure.toString()));
    }
  }
}