
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softwie/Modules/market_place/data/product_repos/products_repo_implement.dart';
import 'package:softwie/Modules/market_place/presentation/manager/products_cubit/product_cubit.dart';
import 'package:softwie/Modules/market_place/presentation/view/products_screen_details.dart';
import 'package:softwie/core/API/api_services.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = "productScreen";

  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => ProductsCubit(ProductsRepoImplement(ApiServices(Dio()))),
    child:   const ProductsScreenDetails());
  }
}
