import 'package:flutter/material.dart';
import 'package:food_ordering_app/features/bag/cart_item.dart';
import 'package:food_ordering_app/providers/view_model_provider.dart';
import 'package:food_ordering_app/viewmodels/cart_list_view_model.dart';

import '../../models/cart_product.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartListViewModel = ViewModelProvider.read<CartListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Pizza Place'),
      ),
      body: ListView(
        children: [
          ValueListenableBuilder(
              valueListenable: cartListViewModel.cartProductsNotifier,
              builder: (context, products, _) => ListView.builder(
                itemBuilder: (context, i) => CartItem(
                  cartProduct: products[i],
                  key: ValueKey(products[i].product.id),
                ),
                itemCount: products.length,
              ),
            ),
        ],
      )
    );
  }
}

