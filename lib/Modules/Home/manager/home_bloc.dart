// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../data/home_repo.dart';
// import 'home_states.dart';
//
// class HomeCubit extends Cubit<HomeStates>{
//   HomeCubit(this.homeRepo) : super(HomeInitialState());
//   final HomeRepo homeRepo;
//   static HomeCubit get(context) => BlocProvider.of(context);
//
//   Future<void> fetchBestSellerBooks() async{
//     emit(HomeBestSellerLoadingState());
//     var result = await homeRepo.fetchBestSellerBooks();
//     result.fold((failure) =>
//         emit(HomeBestSellerFailureState(failure.errorModel.statusMessage)),
//             (books) => emit(HomeBestSellerSuccessState(books)));
//   }
//
//   // Future<void> fetchTopPickBooks() async{
//   //   emit(HomeTopPickLoadingState());
//   //   var result = await homeRepo.fetchTopPickBooks();
//   //   result.fold((failure) =>
//   //       emit(HomeTopPickFailureState(failure.errorModel.statusMessage)),
//   //           (topPicksBook) => emit(HomeTopPickSuccessState(topPicksBook)));
//   //
//   // }
//   //
//   // Future<void> fetchSearchBooks(String value) async{
//   //   emit(HomeSearchLoadingState());
//   //   var result = await homeRepo.fetchSearchBooks(value);
//   //   result.fold((failure) =>
//   //       emit(HomeSearchFailureState(failure.errorModel.statusMessage)),
//   //           (resultSearchBooks) => emit(HomeSearchSuccessState(resultSearchBooks)));
//   // }
//   //
//
//
//
// }