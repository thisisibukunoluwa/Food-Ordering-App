// import 'package:flutter/material.dart';

// class CartView extends StatelessWidget {
//   const CartView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('The Pizza Place'),
//       ),
//       body: ValueListenableBuilder<List<CartProduct>>(
//         valueListenable: cartListViewModel.cartProductsNotifier,
//         builder: (context, products, _) => ListView.builder(
//           itemBuilder: (context, i) => ProductItem(
//             cartProduct: products[i],
//             key: ValueKey(products[i].product.id),
//           ),
//           itemCount: products.length,
//         ),
//       ),
//     );
//   }
// }


