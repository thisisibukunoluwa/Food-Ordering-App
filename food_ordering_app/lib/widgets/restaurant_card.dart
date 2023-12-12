import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/core/routes.dart';
import 'package:food_ordering_app/features/home/models/restaurant_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/gen/assets.gen.dart';
import 'dart:math';

import 'package:food_ordering_app/services/navigation_service.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurant;
  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 353.7.w,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(restaurant.image),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Transform.rotate(
                    angle: -pi / 4.0,
                    child: InkWell(
                      onTap: () {
                        navigationService.navigateToNamed(Routes.productListing,arguments: restaurant);
                      },
                      // TODO: modify button so it is more pixel perfect
                      child: Container(
                        width: 70.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black, // Change the color as needed
                        ),
                        child: const Icon(
                          size: 30.0,
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          Column(
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
          )
        ],
      ),
    );
  }
}
