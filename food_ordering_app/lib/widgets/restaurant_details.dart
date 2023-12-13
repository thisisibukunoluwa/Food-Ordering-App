import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../features/home/models/restaurant_model.dart';
import '../gen/assets.gen.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({
    super.key,
    required this.restaurant,
  });

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          restaurant.title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // we can do this because all the rating are whole numbers, if not we will use a package
            Row(
              children: [
                ...List.generate(
                    restaurant.rating,
                    (_) => const Icon(
                          Icons.star_rate_rounded,
                          color: Color(0xFFFFD700),
                        )),
                ...List.generate(
                    5 - restaurant.rating,
                    (_) => const Icon(
                          Icons.star_rate_rounded,
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
