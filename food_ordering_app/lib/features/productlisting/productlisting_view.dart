import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';
import 'package:food_ordering_app/services/navigation_service.dart';
import 'package:food_ordering_app/utils/formatMenuCategory.dart';
import 'package:food_ordering_app/widgets/glassmorphism.dart';
import 'package:food_ordering_app/widgets/menu_category_option.dart';
import 'package:food_ordering_app/widgets/restaurant_details.dart';

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
    _controller = TabController(
      vsync: this,
      length: widget.restaurant.menu.length,
    );
    _controller.addListener(() {
      // when we change the tab it scrolls to the right secton 
      // it can only scroll to the right section if we create a fn that receives a key 
    });
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
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.black,
                    controller: _controller,
                    tabs: [
                      ...widget.restaurant.menu.map((category) => Tab(
                            text:
                                convertCamelCaseToWords(category.categoryName),
                          ))
                    ]))),
        SliverPadding(
          padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 45.2.w, bottom: 0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var category = widget.restaurant.menu[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.categoryName,
                      key: ValueKey(category.categoryName),
                    ),
                    ...category.meals.map(
                        (menuitem) => MenuCategoryOption(menuitem: menuitem)),
                  ],
                );
              },
              childCount: widget.restaurant.menu.length,
            ),
          ),
        )
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
        backgroundColor: Colors.black45,
        flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.fadeTitle,
              StretchMode.blurBackground,
            ],
            background: Stack(
              children: [
                Transform.scale(
                    scale: 2, child: Image.network(restaurant.image)),
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

//TODO

// add error handling and loading state
