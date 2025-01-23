import 'package:equatable/equatable.dart';

import '../network/error_message_model.dart';
abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {

  //final String errorMessage;


  ServerFailure(super.errMessage, {required String errorMessage});

//  FirebaseAuthException   (errMessage){
//
// if (errMessage.code == 'weak-password') {
// print('The password provided is too weak.');
// } else if (errMessage.code == 'email-already-in-use') {
// print('The account already exists for that email.');
// }
//
// print(errMessage);
// }
}
// abstract class Failure extends Equatable {
//   final ErrorMessageModel errorModel;
//
//   const Failure(this.errorModel);
//
//   @override
//   List<Object> get props => [errorModel];
// }
//
// // General failures
// class ServerFailure extends Failure {
//   const ServerFailure(ErrorMessageModel model,{required String errorMessage}) : super(model);
//
//   static handleError(ErrorMessageModel model) {
//     dynamic result = model.statusMessage;
//     if (result.runtimeType == List) {
//       // ToastHelper.showError(message: result.join('!@#').replaceAll('!@#', "'\n"));
//     }else{
//       // ToastHelper.showError(message: result ?? "");
//     }
//   }
// }
