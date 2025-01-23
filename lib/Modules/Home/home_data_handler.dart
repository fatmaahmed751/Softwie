// import 'package:dartz/dartz.dart';
//
// import '../../Models/best_seller_books_model.dart';
// import '../../Utilities/api_end_point.dart';
// import '../../core/API/generic_request.dart';
// import '../../core/API/request_method.dart';
// import '../../core/error/exceptions.dart';
// import '../../core/error/failures.dart';
//
// class BestSellerDataHandler {
//
//   static Future<Either<Failure, List<BestSellerModel>>>fetchBestSellerModel() async {
//     try {
//       List<BestSellerModel> response = await GenericRequest<BestSellerModel>(
//         method: RequestApi.get(
//           url: APIEndPoint.bestSeller,
//         ),
//         fromMap: BestSellerModel.fromJson,
//       ).getList();
//       print("heeeeeeeeeeeeeeeeel");
//       if (response.isEmpty || response == null) {
//         return throw();
//       }
//       return Right(response);
//     } on ServerException catch (failure) {
//       print(failure.toString().toString());
//       print("heeeeeeeeeeeeeeeeeljjjjjjjj");
//       return Left(ServerFailure("", errorMessage: ''));
//     }
//   }
// }