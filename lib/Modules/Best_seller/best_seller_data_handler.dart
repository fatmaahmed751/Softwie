// import 'package:dartz/dartz.dart';
//
// import '../../Models/best_seller_books_model.dart';
// import '../../Models/book_model.dart';
// import '../../Utilities/api_end_point.dart';
// import '../../core/API/generic_request.dart';
// import '../../core/API/request_method.dart';
// import '../../core/error/exceptions.dart';
// import '../../core/error/failures.dart';
//
// class BestSellerDataHandler {
//
//   static Future<Either<Failure, List<BestSellerBooks>>>fetchBestSellerBooks() async {
//     try {
//       List<BestSellerBooks> response = await GenericRequest<BestSellerBooks>(
//         method: RequestApi.get(
//             url: APIEndPoint.bestSeller,
//            ),
//         fromMap: BestSellerBooks.fromJson,
//       ).getList();
//       print("heeeeeeeeeeeeeeeeel");
//       return Right(response);
//     } on ServerException catch (failure) {
//       print(failure.toString().toString());
//       print("heeeeeeeeeeeeeeeeeljjjjjjjj");
//       return Left(ServerFailure(failure.errorMessageModel));
//     }
//   }
// }