import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';
import 'package:food_ordering_app/services/navigation_service.dart';

class ProductCategoryOption extends StatelessWidget {
  final MenuItem menuitem;
  const ProductCategoryOption({super.key, required this.menuitem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigationService.navigateToNamed('product-details');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 20,
          ),
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
                        imageUrl: menuitem.image),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menuitem.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                        ),
                      ),
                      Text(
                        menuitem.description,
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Text('\$ ${menuitem.price}',
                        style: const TextStyle(fontWeight: FontWeight.bold)))
              ]),
        ],
      ),
    );
  }
}