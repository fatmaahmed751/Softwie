
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softwie/Modules/market_place/presentation/manager/products_cubit/product_states.dart';

import '../../../data/product_repos/products_repo.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit(this.productsRepo) : super(ProductsInitialState());
  final ProductsRepo productsRepo;

  static ProductsCubit get(context) => BlocProvider.of(context);


  Future<void> fetchProductsData(String value) async{
    emit(GetProductsLoadingState());
    try{

    var result = await productsRepo.fetchSearchProducts(value);
    result.fold((failure) =>
        emit(GetProductsErrorState(failure.errMessage)),
            (products) => emit(GetProductsSuccessState(products)));
  }catch(e)
    {
      emit(GetProductsErrorState("failure.errMessage"));
    }
  }


}