import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../models/restaurant_model.dart';
import '../gen/assets.gen.dart';

class RestaurantDetails extends StatelessWidget {
   const RestaurantDetails({
     Key? key,
    required this.restaurant,
    this.isDetails = false,
  }) : super(key: key);
  final bool isDetails;
  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Text( 
                restaurant.title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
            ),
            if (isDetails)  
            Text(
              '${restaurant.deliveryTime} delivery', style:
              TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp)
              )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // we can do this because all the rating are whole numbers, if not we will use a package
            Row(
              children: [
                ...List.generate(
                    restaurant.rating.toInt(),
                    (_) => const Icon(
                          Icons.star_rate_rounded,
                          size: 15,
                          color: Color(0xFFFFD700),
                        )),
                ...List.generate(
                    5 - restaurant.rating.toInt(),
                    (_) => const Icon(
                          Icons.star_rate_rounded,
                          size: 15,
                          color: Color(0xFFC4C4C4),
                        )),
              ],
            ),
            SizedBox(
              width: 105.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(Assets.svgs.locationMinus,
                      semanticsLabel: 'location'),
                  Text("${restaurant.distance} km away")
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
