import 'package:food_ordering_app/gen/assets.gen.dart';

class RestaurantModel {
  final String title;
  final String image;
  final double distance;
  final int rating;
  RestaurantModel({
    required this.title,
    required this.image,
    required this.distance,
    required this.rating,
  });

  static List<RestaurantModel> restaurants = [
    RestaurantModel(
        title: "The Pizza Place",
        image: Assets.popularrestaurants.pizzaplace.path,
        distance: 2,
        rating: 5),
    RestaurantModel(
        title: "The Ice Cream Factory",
        image: Assets.popularrestaurants.icecreamfactory.path,
        distance: 1.2,
        rating: 5),
    RestaurantModel(
        title: "Burger King",
        image: Assets.popularrestaurants.burgerking.path,
        distance: 2.3,
        rating: 4),
    RestaurantModel(
        title: "The Coffee House",
        image: Assets.popularrestaurants.coffeehouse.path,
        distance: 1.2,
        rating: 5),
  ];
}
