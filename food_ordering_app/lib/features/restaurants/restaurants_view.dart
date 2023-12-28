import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';
import 'package:food_ordering_app/providers/view_model_provider.dart';
import 'package:food_ordering_app/viewmodels/restaurant_view_model.dart';
import 'package:food_ordering_app/widgets/custom_button.dart';
import 'package:food_ordering_app/widgets/restaurant_card.dart';
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
  // Future<void>? restaurants;
  ApiResponse<dynamic> apiResponse = ApiResponse.initial('theres no data');
  List<RestaurantModel> restaurantsData = [];
  List<Widget> restaurantCards = [];

//ideally i wanted to put this logic in initState() method so that it will be called once and the data fetched once when the widget is built but i get this error -  The following assertion was thrown building _MainBody:
          //  dependOnInheritedWidgetOfExactType<ViewModelProvider<RestaurantViewModel>>() or
          //  dependOnInheritedElement() was called before _ProductsListState.initState() completed.
          //  When an inherited widget changes, for example if the value of Theme.of() changes, its dependent
          //  widgets are rebuilt. If the dependent widget's reference to the inherited widget is in a constructor
          //  or an initState() method, then the rebuilt dependent widget will not reflect the changes in the
          //  inherited widget.
          //  Typically references to inherited widgets should occur in widget build() methods. Alternatively,
          //  initialization based on inherited widgets can be placed in the didChangeDependencies method, which
          //  is called after initState and whenever the dependencies change thereafter.
           
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final restaurants = ViewModelProvider.read<RestaurantViewModel>(context);
    restaurants.fetchRestaurants().then((_) {
      setState(() {
        apiResponse = restaurants.response;
        restaurantsData = apiResponse.data;
        restaurantCards = restaurantsData.map((restaurant) {
          return RestaurantCard(restaurant: restaurant);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (apiResponse.status) {
      case Status.loading:
        return const Center(child: CircularProgressIndicator());
      case Status.completed:
      // add spotify type scroll effect for this home page 
      return Column(
        children: [
          ...restaurantCards,
          CustomButton(
              buttonText: "View all Restaurants",
              onPressed: () {},
              color: Colors.white)
        ],
      );
      case Status.error:
        return const Center(
          child: Text('An unknown error occurred!!!'),
        );
      case Status.initial:
        return const Center(
          child: Text('No data'),
        );
      default:
        return const Center(
          child: Text('All restaurants'),
        );
    }
  }
}

class _MainBody extends StatelessWidget {
  const _MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 45.2.w, bottom: 0),
      child: ListView(
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
