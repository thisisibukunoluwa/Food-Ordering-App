import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_app/features/bag/cart_view.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';
import 'package:food_ordering_app/features/orders/order_view.dart';
import 'package:food_ordering_app/features/profile/profile_view.dart';
import 'package:food_ordering_app/providers/view_model_provider.dart';
import 'package:food_ordering_app/viewmodels/restaurant_view_model.dart';
import 'package:food_ordering_app/widgets/custom_button.dart';
import 'package:food_ordering_app/widgets/restaurant_card.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import '../../gen/assets.gen.dart';
import '../../models/api_response.dart';

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
    return const Scaffold(
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
            fillColor: const Color(0xFFF5F4F8),
            hintText: 'Search for a vendor or product',
            prefixIcon: const Icon(Icons.search),
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

class _ProductsList extends StatefulWidget {
  const _ProductsList({super.key});

  @override
  State<_ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<_ProductsList> {
  getBody(BuildContext context, ApiResponse apiResponse) {
    switch (apiResponse.status) {
      case Status.loading:
        return const Center(child: CircularProgressIndicator());
      case Status.completed:
        return SizedBox(
          height: 600,
          child: ListView(
            children: [
              // ...restaurantCards,
              CustomButton(
                  buttonText: "View all Restaurants",
                  onPressed: () {},
                  color: Colors.white)
            ],
          ),
        );
      case Status.error:
        return const Center(
          child: Text('An unknown error occurred!!!'),
        );
      case Status.initial:
      default:
        return const Center(
          child: Text('Get your favorite product'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    // we will actually get the restaurant data from a viewmodel
    final restaurants = ViewModelProvider.read<RestaurantViewModel>(context);

    restaurants.fetchRestaurants(); // it is working

    // when we access the response - the getter we are supposed to get the latest value of api response

    // the apiResponse variable does not change

    // we are saving the initial value in a variable maybe thatswhy it doesn;t change???

    var apiResponse = restaurants.response;

    // print(apiResponse); // the api reponse variable never gets updated

    // print(apiResponse.data);
    // the api response data is null here

    // List<Widget> restaurantCards = apiResponse.data.map((restaurant) {
    //   return Center(
    //     child: RestaurantCard(restaurant: restaurant),
    //   );
    // }).toList();

    return getBody(context, apiResponse);
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
            padding: const EdgeInsets.symmetric(vertical: 20),
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
                const Text(
                  "View all",
                  style: TextStyle(color: Color(0xFF797D82)),
                )
              ],
            ),
          ),
          const _ProductsList(),
        ],
      ),
    );
  }
}

//797D82 - black500
