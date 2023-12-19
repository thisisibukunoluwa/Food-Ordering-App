import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';
import 'package:food_ordering_app/services/navigation_service.dart';
import 'package:food_ordering_app/utils/formatMenuCategory.dart';
import 'package:food_ordering_app/widgets/glassmorphism.dart';
import 'package:food_ordering_app/widgets/restaurant_details.dart';

enum MenuItemCategory {
  comboDeals,
  classicPizza,
  premiumPizza,
  sides,
  drinks,
}

class ProductslistingView extends StatefulWidget {
  final RestaurantModel restaurant;
  const ProductslistingView({
    super.key,
    required this.restaurant,
  });

  @override
  State<ProductslistingView> createState() => _ProductslistingViewState();
}

class _ProductslistingViewState extends State<ProductslistingView>
    with TickerProviderStateMixin {
  late TabController _controller;
  late ScrollController _scrollcontroller;

  final GlobalKey key1 = GlobalKey();
  final GlobalKey key2 = GlobalKey();
  final GlobalKey key3 = GlobalKey();
  final GlobalKey key4 = GlobalKey();

  @override
  void initState() {
    _scrollcontroller = ScrollController();
    _controller =
        TabController(vsync: this, length: MenuItemCategory.values.length);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // this is not working
    // final args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _ProductListingViewAppBar(restaurant: widget.restaurant),
        SliverPadding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 0, bottom: 0),
          sliver: SliverToBoxAdapter(
            child: RestaurantDetails(
                restaurant: widget.restaurant, isDetails: true),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 40.h),
        ),
        SliverToBoxAdapter(
            child: SizedBox(
                height: 30.h,
                child: TabBar(
                    // onTap: () => _scrollToSection(key),
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.black,
                    controller: _controller,
                    tabs: [
                      ...MenuItemCategory.values.map((category) => Tab(
                            text: convertCamelCaseToWords(category.name),
                          ))
                    ]))),
        //
      ],
    ));
  }
}

class _ProductListingViewAppBar extends StatelessWidget {
  const _ProductListingViewAppBar({
    super.key,
    required this.restaurant,
  });

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        pinned: true,
        expandedHeight: 200,
        backgroundColor: Colors.transparent,
        flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.fadeTitle,
              StretchMode.blurBackground,
            ],
            background: Stack(
              children: [
                Transform.scale(scale: 2, child: Image.asset(restaurant.image)),
                Positioned(
                    left: 10,
                    bottom: 20,
                    child: GlassMorphism(
                        start: 0.1,
                        end: 0.1,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Free delivery on orders above \$50",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ))))
              ],
            )));
  }
}

_scrollToSection(GlobalKey key) {
  final targetContext = key.currentContext;
  if (targetContext != null) {
    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
  }
}

// we'll complete the app normally but then we'll create another branch , that uses the data as mock data with futures to simulate network delay , then the third one will be a whole refactoring with riverpod

//restaurant - menu

//TODO

// GET the restaurant class that we have and convert it to json, or mutate the json we have from chatgpt

// deserialize so we are able to access it , like its from a nromal network server

// add a service and repository and an artificial Future,delay to simulate network delay

// add error handling and loading state

// add the viewModel way from our notion , that will be our state management - using only ValueNotifiers 

