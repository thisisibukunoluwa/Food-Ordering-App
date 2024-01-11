import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';
import 'package:food_ordering_app/services/navigation_service.dart';

class ProductCategoryOption extends StatelessWidget {
  final MenuItem menuItem;
  const ProductCategoryOption({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    // timeDilation = 2.5;
    return GestureDetector(
      onTap: () {
        navigationService.navigateToNamed('/product-details',
            arguments: menuItem);
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
                    child: Hero(
                      tag: '${menuItem.title}-detail-image',
                      child: CachedNetworkImage(
                          width: 200.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                          imageUrl: menuItem.image),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menuItem.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                        ),
                      ),
                      Text(
                        menuItem.description,
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Text('\$ ${menuItem.price}',
                        style: const TextStyle(fontWeight: FontWeight.bold)))
              ]),
        ],
      ),
    );
  }
}


// TODO Hero animation 