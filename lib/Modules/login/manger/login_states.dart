abstract class UserLoginStates{}

class UserLoginInitialState extends UserLoginStates{}

class UserLoginSuccessState extends UserLoginStates{}

class UserLoginLoadingState extends UserLoginStates{}

class UserLoginErrorState extends UserLoginStates{
  final String errorMessage;

  UserLoginErrorState(this.errorMessage);
}