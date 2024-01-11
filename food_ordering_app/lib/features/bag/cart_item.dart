import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/models/cart_product.dart';
import 'package:food_ordering_app/widgets/dashed_line.dart';

import '../../core/constants/colors.dart';
import '../../models/restaurant_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required, required this.cartProduct});
  final CartProduct cartProduct;
  @override
  Widget build(BuildContext context) {
    final currentProduct = cartProduct.product;
    final _cartItemCountNotifier = ValueNotifier(0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: CachedNetworkImage(
                        width: 200.0,
                        height: 80.0,
                        fit: BoxFit.cover,
                        imageUrl: currentProduct.image),
                  ),
                ),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     currentProduct.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                        color: Colors.black
                      ),
                    ),
                   ValueListenableBuilder(
                    valueListenable:_cartItemCountNotifier,
                     builder:(context,value,_){
                      return Text(
                                '\$${(currentProduct.price * value).toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    color: AppColors.black500));
                    })
                  ],
                ),
              ),
             Flexible(
                  flex: 1,
                  child: Column(
                      children: [
                        Icon(Icons.close),
                        Row(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                            const Icon(Icons.close),
                              ValueListenableBuilder(
                                valueListenable:_cartItemCountNotifier,
                                builder:(context,value,_){
                                  return  Text(
                                '\$${currentProduct.price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.sp,
                                  ),
                                );
                                }),
                             InkWell(
                              child: const Icon(Icons.add),
                              onTap: () {
                                if (_cartItemCountNotifier.value > 1) {
                                  _cartItemCountNotifier.value--;
                                }
                                //else set state that changes color of button 
                              },
                             ),
                             InkWell(
                              child: const Icon(Icons.add),
                              onTap: () {
                                _cartItemCountNotifier.value++;
                              },
                             ),
                           ],
                        )
                      ],
                  ),
              )
            ]),
            CustomPaint(painter: DashedLinePainter())
      ],
    );
  }
}
