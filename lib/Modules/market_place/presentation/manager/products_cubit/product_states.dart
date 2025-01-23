
import '../../../../../Models/products_model.dart';

class  ProductsStates{}

class ProductsInitialState extends  ProductsStates{}

class GetProductsLoadingState extends  ProductsStates{}

class GetProductsSuccessState extends  ProductsStates{
  final List<ProductsModel> products;
 GetProductsSuccessState(this.products);
}

class GetProductsErrorState extends  ProductsStates{
  final String errorMessage;

  GetProductsErrorState(this.errorMessage);
}