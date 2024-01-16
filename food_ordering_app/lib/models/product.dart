

class Product {
  final String id;
  final String image;
  final String title;
  final double price;
  bool isAddedToCart;

  Product(this.id, {
    required this.image,
    required this.title,
    required this.price,
    this.isAddedToCart = false,
  });
  @override
  String toString() => ''' Product 
  id: $id,
  title: $title,
  price: $price,
  isAddedToCart: $isAddedToCart
  ''';
}
