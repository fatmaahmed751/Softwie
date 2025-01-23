
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Models/user_login_model.dart';
import '../data/repos/login_and_register_repo.dart';
import 'login_states.dart';

class UserLoginCubit extends Cubit<UserLoginStates>{

  UserLoginCubit(this.loginAndRegisterRepo):super(UserLoginInitialState());


  static UserLoginCubit get(context)=>BlocProvider.of(context);

  final LoginAndRegisterRepo loginAndRegisterRepo;

  Future<void> getUserData(UserLoginModel userLoginModel) async{
    emit(UserLoginLoadingState());
    var result =
    await loginAndRegisterRepo.fetchUserLoginData(userLoginModel);
    result.fold((serverFailure) =>
        emit(UserLoginErrorState(serverFailure.errMessage.toString())),
            (userLoginModel) =>
            emit(UserLoginSuccessState()));

  }
}
