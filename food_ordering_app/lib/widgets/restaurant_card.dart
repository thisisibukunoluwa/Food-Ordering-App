import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/core/routes.dart';
import 'package:food_ordering_app/features/home/models/restaurant_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/gen/assets.gen.dart';
import 'dart:math';

import 'package:food_ordering_app/services/navigation_service.dart';
import 'package:food_ordering_app/widgets/restaurant_details.dart';

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
                    child: GestureDetector(
                      onTap: () {
                        navigationService.navigateToNamed(
                          Routes.productListing, 
                        arguments: restaurant
                       );
                      },
                      // TODO: modify button so it is more pixel perfect
                      child: Container(
                        width: 70.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black, 
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
          RestaurantDetails(restaurant: restaurant)
        ],
      ),
    );
  }
}