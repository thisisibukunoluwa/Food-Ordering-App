import 'package:flutter/material.dart';
import 'package:food_ordering_app/features/home/models/restaurant_model.dart';
import 'package:food_ordering_app/services/navigation_service.dart';
import 'package:food_ordering_app/widgets/glassmorphism.dart';
import 'package:food_ordering_app/widgets/restaurant_details.dart';

class ProductslistingView extends StatelessWidget {
  final RestaurantModel restaurant;
  const ProductslistingView({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    // this is not working
    // final args = ModalRoute.of(context)!.settings.arguments;

    return  Scaffold(
        body: CustomScrollView(
      slivers: [
        _ProductListingViewAppBar(restaurant: restaurant),
        SliverToBoxAdapter(
          child: RestaurantDetails(restaurant: restaurant),
        )
      ],
      
    )
        //   body: Placeholder(
        //       child: Center(
        //           child: SizedBox(
        //     height: 200,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [

        //         InkWell(
        //             onTap: () {
        //               navigationService.navigateBack();
        //             },
        //             child: Text("tap me to pop"))
        //       ],
        //     ),
        //   ))
        // ),
        );
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
      backgroundColor: Color(0xFFFFA500),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
        ],  
        background: Stack(
          children: [
           Transform.scale(
            scale: 2,
            child: Image.asset(restaurant.image)
            ),
            Positioned(
              left :10, 
              bottom: 20,
              child: GlassMorphism(
              start: 0.1, end: 0.1,
              child:TextButton(
               onPressed: (){},child: const Text(
                  "Free delivery on orders above \$50",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white
                  ),
                )
              )
          )
        )
          ],
        )
      )
    );
  }
}
