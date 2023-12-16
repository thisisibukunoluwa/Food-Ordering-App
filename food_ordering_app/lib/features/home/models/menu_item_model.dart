class MenuItem {
  String title;
  String description;
  double price;
  String image;

  MenuItem({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });
}

class MenuCategory {
  final String categoryName;
  final List<MenuItem> meals;

  MenuCategory({required this.categoryName, required this.meals});
}
