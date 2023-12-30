import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';

import '../../widgets/menu_category_option.dart';

class MenuCategorySection extends StatelessWidget {
  final RestaurantModel restaurant;
  final int index;
  const MenuCategorySection({super.key, required this.restaurant, required this.index});

  @override
  Widget build(BuildContext context) {
    var category = restaurant.menu[index];
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 45.2.w, bottom: 0),
      child: SizedBox(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              category.categoryName,
              key: ValueKey(category.categoryName),
            ),
            ...category.meals
                .map((menuitem) => MenuCategoryOption(menuitem: menuitem)),
          ],
        ),
      ),
    );
  }
}


// SliverList(
//         delegate: SliverChildBuilderDelegate(
//           (BuildContext context, int index) {
            

//           },
//           childCount: restaurant.menu.length,
//         ),
// ),



//  SliverPadding(
//       padding: 
//       sliver: 
//     );
