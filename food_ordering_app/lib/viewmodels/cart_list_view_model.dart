import 'package:flutter/material.dart';

import '../models/cart_product.dart';
import '../models/product.dart';
// import '../models/product.dart';

// this is the ValueNotifier to update the value of the List<CartProduct>
class CartListValueNotifier extends ValueNotifier<List<CartProduct>> {
  CartListValueNotifier(this._value) : super(_value);

  final List<CartProduct> _value;

  @override
  List<CartProduct> get value => _value;

  @override
  set value(List<CartProduct> newValue) {
    super.value = newValue;
  }

  // void getCount(CartProduct cartProduct) {
  //   cartpro
  // }
 void addProductToCart(CartProduct cartProduct) {
    // Search for the item in the cart by its id
    CartProduct existingProduct;
    try {
      existingProduct = value.firstWhere(
        (product) => product.product.id == cartProduct.product.id,
      );
      // If the item is already in the cart, increase the count
      existingProduct.count++;
    } catch (e) {
      // If no existing product is found, add the new product to the list
      cartProduct.product.isAddedToCart = true;
      cartProduct.count = 1;
      value.add(cartProduct);
    }
    notifyListeners();
  }


  void incrementCount(CartProduct cartProduct) {
    cartProduct.count++;
    notifyListeners();
  }

  void decrementCount(CartProduct cartProduct) {
    if (cartProduct.count > 1) {
      cartProduct.count--;
    } else {
      cartProduct.product.isAddedToCart = false;
      cartProduct.count = 0;
    }
    notifyListeners();
  }

bool deleteProduct(CartProduct cartProduct) {
      try {
        final removedProduct = value.remove(cartProduct);
        if (removedProduct) {
          notifyListeners();
          return true;
        } else {
          return false; // Product not found or not removed
        }
      } catch (e) {
        // Handle any exceptions that might occur during removal
        print('Error removing product: $e');
        return false;
      }
  }

}

// from the CartlistViewModel, the
class CartListViewModel {
  /// cart count notifier
  final cartCountNotifier = ValueNotifier<int>(0);

  /// default values
  final cartProductsNotifier = CartListValueNotifier(<CartProduct>[]);

  void addToCart(CartProduct cartProduct) {
    cartProductsNotifier.addProductToCart(cartProduct);
    cartCountNotifier.value++;
  }

  void incrementCount(CartProduct cartProduct) {
    cartProductsNotifier.incrementCount(cartProduct);
    cartCountNotifier.value++;
  }

  void decrementCount(CartProduct cartProduct) {
    cartProductsNotifier.decrementCount(cartProduct);
    cartCountNotifier.value--;
  }

  bool deleteProduct(CartProduct cartProduct) {
    final count = cartProduct.count;
    final res = cartProductsNotifier.deleteProduct(cartProduct);
    cartCountNotifier.value -= count;
    return res;
  }
}

// the cart list view model is what we are exposing publicly to use

// bag will be a list of CartProduct List<CartProduct> each is a cart product and each is their type

// in the product detail page, we can either increment or decrement this value

// we open the productdetail page , press the increment button , when we do we increment the count property of the CartProduct class
// to do this , the method from the button pairs receive the CartProduct object , then we can increment or decrement the value

// when we now press the add to bag, we now append the cart product value to our List<CartProduct>

// - we have to make sure we don't add it twice , so we check isAdded boolean
