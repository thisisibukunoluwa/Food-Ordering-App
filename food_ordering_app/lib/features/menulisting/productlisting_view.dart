import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/features/menulisting/product_category_section.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';
import 'package:food_ordering_app/services/navigation_service.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:food_ordering_app/utils/formatMenuCategory.dart';
import 'package:food_ordering_app/widgets/glassmorphism.dart';
import 'package:food_ordering_app/widgets/restaurant_details.dart';

import '../../widgets/navback_button.dart';

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
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late AutoScrollController _autoScrollController;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.restaurant.menu.length, vsync: this);
    _autoScrollController = AutoScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _autoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // this is not working
    // final args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        body: VerticalScrollableTabView(
      autoScrollController: _autoScrollController,
      scrollbarThumbVisibility: false,
      tabController: _tabController,
      listItemData: widget.restaurant.menu,
      verticalScrollPosition: VerticalScrollPosition.begin,
      eachItemChild: (object, index) =>
          ProductCategorySection(restaurant: widget.restaurant, index: index),
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
                    indicatorWeight: 3.0,
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                    controller: _tabController,
                    onTap: (index) {
                      VerticalScrollableTabBarStatus.setIndex(index);
                    },
                    tabs: [
                      ...widget.restaurant.menu.map((category) => Tab(
                            text:
                                convertCamelCaseToWords(category.categoryName),
                          )),
                    ])
                    )),
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
        automaticallyImplyLeading: false,
        pinned: false,
        expandedHeight: 200,
        backgroundColor: Colors.transparent,
        flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.fadeTitle,
              StretchMode.blurBackground,
            ],
            background: Stack(
              children: [
                Transform.scale(
                    scale: 2, child: Image.network(restaurant.image)),
                const Positioned(
                  left:10,
                  top:50,
                   child:NavBackButton(color:Colors.white)),
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


// we'll complete the app normally but then we'll create another branch , that uses the data as mock data with futures to simulate network delay , then the third one will be a whole refactoring with riverpod

//TODO

// add error handling and loading state
