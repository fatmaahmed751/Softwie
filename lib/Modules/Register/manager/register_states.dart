
import '../../../Models/user_register_model.dart';

abstract class UserRegisterStates{}

class UserRegisterInitialState extends UserRegisterStates{}

class UserRegisterSuccessState extends UserRegisterStates{}

class UserRegisterLoadingState extends UserRegisterStates{}

class UserRegisterErrorState extends UserRegisterStates{
  final String errorMessage;

  UserRegisterErrorState(this.errorMessage);
}
class PickedProfileImageSuccessState extends UserRegisterStates{}

class PickedProfileImageLoadingState extends UserRegisterStates{}

class PickedProfileImageErrorState extends UserRegisterStates{


  PickedProfileImageErrorState();
}

class PickedCoverImageSuccessState extends UserRegisterStates{}

class PickedCoverImageErrorState extends UserRegisterStates{}

class PickedCoverImageLoadingState extends UserRegisterStates{}


class UploadCoverImageSuccessState extends UserRegisterStates{}

class UploadCoverImageErrorState extends UserRegisterStates{}

class UploadProfileImageSuccessState extends UserRegisterStates{}

class UploadProfileImageErrorState extends UserRegisterStates{}


class GetUserRegisterDataSuccessState extends UserRegisterStates{
  UserRegisterModel userRegisterModel;
  GetUserRegisterDataSuccessState(this.userRegisterModel);
}

class GetUserRegisterDataErrorState extends UserRegisterStates{
  final String errorMessage;

  GetUserRegisterDataErrorState(this.errorMessage);
}

class GetUserRegisterDataLoadingState extends UserRegisterStates{}

class UpdateUserErrorState extends UserRegisterStates{}
