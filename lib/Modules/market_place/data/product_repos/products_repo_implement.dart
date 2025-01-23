import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:softwie/Modules/market_place/data/product_repos/products_repo.dart';
import '../../../../Utilities/api_end_point.dart';
import '../../../../core/API/api_services.dart';
import '../../../../core/API/generic_request.dart';
import '../../../../core/API/request_method.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../Models/products_model.dart';

class ProductsRepoImplement implements ProductsRepo {
  ApiServices apiServices;

  ProductsRepoImplement(this.apiServices);

  @override
  Future<Either<Failure, List<ProductsModel>>> fetchSearchProducts(
      String value) async {
    try {
      var data = await apiServices.getSearch(value: value);

      if (data.containsKey('products') && data['products'] is List) {
        List<dynamic> productsData = data['products'];

        List<ProductsModel> productModel = productsData.map((product) =>
            ProductsModel.fromJson(product)).toList();

        return Right(productModel);
      } else {
        return Left(ServerFailure('Products data is invalid', errorMessage: ''));
      }
    } catch (e) {
      if (e is DioException) {

        print('Dio error: $e');
        return Left(ServerFailure('Products data is invalid', errorMessage: ''));
      } else {
        print('General error: $e');
        return Left(
            ServerFailure('Oops! There was an error. Please try again.', errorMessage: ''));
      }
    }
  }



}

