// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mvc_pattern/mvc_pattern.dart';
// import 'package:softwie/Models/best_seller_books_model.dart';
// import 'package:softwie/Modules/Best_seller/best_seller_data_handler.dart';
//
// import '../../Models/book_model.dart';
// import '../../Utilities/router_config.dart';
// import '../../Utilities/strings.dart';
// import '../../Widgets/home_carusol_widget.dart';
// import '../../Widgets/toast_helper.dart';
//
// class BestSellerController extends ControllerMVC {
//   // singleton
//   factory BestSellerController() {
//     _this ??= BestSellerController._();
//     return _this!;
//   }
//
//   static BestSellerController? _this;
//
//   BestSellerController._();
//   bool loading = false;
// List<BestSellerBooks> books=[];
//   getBestSellerBooks() async {
//     final result = await BestSellerDataHandler.fetchBestSellerBooks();
//
//     result.fold((l) {
//       ToastHelper.showError(message: l.errorModel.statusMessage);
//     }, (r) async {
//       books=r;
//     });
//     setState(() {
//       loading = false;
//     });
//   }
// }
