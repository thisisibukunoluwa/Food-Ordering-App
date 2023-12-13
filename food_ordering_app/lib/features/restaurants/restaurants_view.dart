import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_app/features/bag/cart_view.dart';
import 'package:food_ordering_app/features/home/models/restaurant_model.dart';
import 'package:food_ordering_app/features/orders/order_view.dart';
import 'package:food_ordering_app/features/profile/profile_view.dart';
import 'package:food_ordering_app/widgets/custom_button.dart';
import 'package:food_ordering_app/widgets/restaurant_card.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import '../../gen/assets.gen.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key});

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  int currentPageIndex = 0;

  void _changePage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: _MainBody(),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF5F4F8),
            hintText: 'Search for a vendor or product',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide.none)),
        // everytime the state is updated it will call the filterCardProvider
        onChanged: (arg) {});
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Deliver to:",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                  )),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("08776 Serenity Ports, New York",
                      style: TextStyle(color: Colors.black)),
                  Icon(Icons.keyboard_arrow_down_rounded)
                ],
              )
            ]),
        SvgPicture.asset(
          Assets.svgs.userProfile,
          semanticsLabel: 'profile icon',
        )
      ],
    );
  }
}

class _ProductsList extends StatelessWidget {
  const _ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurants = RestaurantModel.restaurants;

    List<Widget> restaurantCards = restaurants.map((restaurant) {
      return Center(
        child: RestaurantCard(restaurant: restaurant),
      );
    }).toList();

    return SizedBox(
      height: 600,
      child: ListView(
        children: [
          ...restaurantCards,
          CustomButton(
              buttonText: "View all Restaurants",
              onPressed: () {},
              color: Colors.white)
        ],
      ),
    );
  }
}

class _MainBody extends StatelessWidget {
  const _MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 85.2.w, bottom: 0),
      child: Column(
        children: [
          const _Header(),
          SizedBox(
            height: 20.h,
          ),
          const _SearchBar(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Restaurants",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                      color: Colors.black),
                ),
                Text(
                  "View all",
                  style: TextStyle(color: Color(0xFF797D82)),
                )
              ],
            ),
          ),
          _ProductsList(),
        ],
      ),
    );
  }
}

//797D82 - black500
