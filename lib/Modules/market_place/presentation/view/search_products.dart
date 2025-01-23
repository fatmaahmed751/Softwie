import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utilities/theme_helper.dart';
import '../manager/products_cubit/product_cubit.dart';
import '../manager/products_cubit/product_states.dart';

class SearchProducts extends StatelessWidget {
  const SearchProducts({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocConsumer<ProductsCubit, ProductsStates>(
      builder: (BuildContext context, ProductsStates state) {
        return Row(
          children: [
            SizedBox(
              height: 50.h,
              width: 320.w,
              child: TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(color: ThemeClass.of(context).labelColor),
                controller: searchController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ThemeClass.of(context).secondaryBlackColor),
                    borderRadius: BorderRadius.circular(201),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(201),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                  hintText: 'what do you search for ?',
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: ThemeClass.of(context).labelColor),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 21,
                      color: ThemeClass.of(context).labelColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(width: 7.0, color: Colors.white),
                  ),
                ),
                // cursorColor: ThemeClass.of(context.grey,
                onFieldSubmitted: (String value) {
                  ProductsCubit.get(context).fetchProductsData(value);
                  searchController.clear();
                },
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: ThemeClass.of(context).labelColor,
                )),
          ],
        );
      },
      listener: (BuildContext context, ProductsStates state) {},
    );
  }
}
