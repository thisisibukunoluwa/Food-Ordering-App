import 'package:flutter/material.dart';
import 'package:food_ordering_app/features/home/models/restaurant_model.dart';

class ProductslistingView extends StatelessWidget {
  final RestaurantModel restaurant;
  const ProductslistingView({
    super.key, required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as RestaurantModel;

    return Placeholder(
      child: Text(args.title),
    );
  }
}

