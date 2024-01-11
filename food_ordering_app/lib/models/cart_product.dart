import 'package:food_ordering_app/models/product.dart';


class CartProduct {
  CartProduct({
    required this.product,
    this.count = 0,
  });

  final Product product;
  int count;

  @override
  String toString() => ''' Product 
  count: $count,
  product: $product,
  ''';
}


