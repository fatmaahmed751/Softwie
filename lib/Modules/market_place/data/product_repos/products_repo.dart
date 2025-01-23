
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../Models/products_model.dart';

abstract class ProductsRepo{

  Future<Either<Failure,List<ProductsModel>>> fetchSearchProducts(String value);
}
