import 'package:uuid/uuid.dart';

class RestaurantResponse {
  final List<RestaurantModel> restaurants;

  RestaurantResponse({
    required this.restaurants,
  });

  factory RestaurantResponse.fromMap(Map<String, dynamic> map) {
    return RestaurantResponse(
      restaurants: List<RestaurantModel>.from(
          map['restaurants']?.map((x) => RestaurantModel.fromJson(x))),
    );
  }

  @override
  String toString() => 'RestaurantResponse(restaurants: $restaurants)';
}

class RestaurantModel {
  final String title;
  final String image;
  final double distance;
  final double rating;
  final String deliveryTime;
  final List<MenuCategory> menu;

  RestaurantModel({
    required this.title,
    required this.image,
    required this.distance,
    required this.rating,
    required this.deliveryTime,
    required this.menu,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> menuJson = json['menu'];
    List<MenuCategory> menu =
        menuJson.map((category) => MenuCategory.fromJson(category)).toList();

    return RestaurantModel(
      title: json['title'],
      image: json['image'],
      distance: json['distance'].toDouble(),
      rating: json['rating'].toDouble(),
      deliveryTime: json['deliveryTime'],
      menu: menu,
    );
  }
}

class MenuCategory {
  final String categoryName;
  final List<MenuItem> meals;

  MenuCategory({
    required this.categoryName,
    required this.meals,
  });

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    List<dynamic> mealsJson = json['meals'];
    List<MenuItem> meals =
        mealsJson.map((meal) => MenuItem.fromJson(meal)).toList();

    return MenuCategory(
      categoryName: json['categoryName'],
      meals: meals,
    );
  }
}

class MenuItem {
   final String id;
  final String title;
  final String description;
  final double price;
  final String image;

  MenuItem({
    String? id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  }) : id = id ?? const Uuid().v4();

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      image: json['image'],
    );
  }
}
