






class Product {
  final String id;
  final String image;
  final String title;
  final double price;
  final int quantity;
  bool isAddedToCart;

  Product(this.id, {
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
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
