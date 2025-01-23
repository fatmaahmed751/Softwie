import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softwie/Utilities/text_style_helper.dart';
import 'package:softwie/Utilities/theme_helper.dart';
import '../../../../Models/products_model.dart';
import '../manager/products_cubit/product_cubit.dart';
import '../manager/products_cubit/product_states.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsStates>(
        builder: (BuildContext context, ProductsStates state) {
      if (state is GetProductsSuccessState) {
        return Wrap(
            spacing: 15.w,
            runSpacing: 15.h,
            children: List.generate(10, (index) {
              return productContainerDetails(state.products[index], context);
            }
            )
        );
      }else{
        const Center(child: CircularProgressIndicator());
      }
      return  const Center(child: CircularProgressIndicator());
    }

    );
  }

  Widget productContainerDetails(ProductsModel product,context) => Container(
    height: 250.h,
        width: 170.w,
        decoration: BoxDecoration(
          border: Border.all(color: ThemeClass.of(context).primaryColor.withOpacity(0.5), width: 1.0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Column(children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:20.0),
                  child: IconButton(
                    onPressed: (){},
                    icon:  Icon(
                      color: ThemeClass.of(context).labelColor,
                   Icons.favorite_border,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              product.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
             style:TextStyleHelper.of(context).b_16,
            ),
            Expanded(
              child: Row(
                children: [
                  Text('EGP ${product.price}',
                     style:TextStyleHelper.of(context).b_16
                ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${product.discountPercentage} EGP',
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ]),
        ),
      );
}
