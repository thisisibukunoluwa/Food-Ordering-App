import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';

import '../../widgets/product_category_option.dart';

class ProductCategorySection extends StatelessWidget {
  final RestaurantModel restaurant;
  final int index;
  const ProductCategorySection({super.key, required this.restaurant, required this.index});

  @override
  Widget build(BuildContext context) {
    var category = restaurant.menu[index];
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 45.2.w, bottom: 0),
      child: Column( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              category.categoryName, 
              style: const TextStyle(
                fontWeight:FontWeight.bold, 
                color: Colors.grey
              ),
              key: ValueKey(category.categoryName),
            ),
            // SizedBox(height: 20,),
            ...category.meals.map((menuitem) => ProductCategoryOption(menuitem: menuitem)),
          ],
      ),
    );
  }
}


