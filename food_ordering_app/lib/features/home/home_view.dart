import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_app/features/bag/cart_view.dart';
import 'package:food_ordering_app/features/orders/order_view.dart';
import 'package:food_ordering_app/features/profile/profile_view.dart';
import 'package:food_ordering_app/features/restaurants/restaurants_view.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import '../../gen/assets.gen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
        body: [
          RestaurantsView(),
          CartView(),
          OrderView(),
          ProfileView()
        ][currentPageIndex],
        bottomNavigationBar: DotNavigationBar(
          marginR: EdgeInsets.symmetric(horizontal: 20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(27, 37, 35, 35),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: 16,
          currentIndex: currentPageIndex,
          onTap: _changePage,
          // dotIndicatorColor: Colors.black,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: SvgPicture.asset(currentPageIndex == 0
                  ? Assets.svgs.homeActive
                  : Assets.svgs.home),
              selectedColor: Colors.transparent,
            ),
            DotNavigationBarItem(
              icon: SvgPicture.asset(currentPageIndex == 1
                  ? Assets.svgs.bagActive
                  : Assets.svgs.bag),
              selectedColor: Colors.transparent,
            ),

            DotNavigationBarItem(
              icon: SvgPicture.asset(currentPageIndex == 2
                  ? Assets.svgs.ordersActive
                  : Assets.svgs.orders),
              selectedColor: Colors.transparent,
            ),

            DotNavigationBarItem(
              icon: SvgPicture.asset(currentPageIndex == 3
                  ? Assets.svgs.profileActive
                  : Assets.svgs.profile),
              selectedColor: Colors.transparent,
            ),
          ],
        ));
  }
}
