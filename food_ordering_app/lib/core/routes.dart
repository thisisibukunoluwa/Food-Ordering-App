import 'package:flutter/material.dart';

class Routes {
  static const confirmation = '/confirmation';
  static const productListing = '/product-listing';
  static const checkout = '/checkout';
  static const productDetails = '/product-details';
  static const cart = '/cart';
  static const orders = '/orders';
  static const orderDetails = '/order-details';
  static const profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case confirmation:
        return MaterialPageRoute(builder: (_) => ConfirmationView());
      case orders:
        return MaterialPageRoute(builder: (_) => OrderView());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case checkout:
        return MaterialPageRoute(builder: (_) => const CheckoutView());
      case cart:
        return MaterialPageRoute(builder: (_) => const CartView());
      case productDetails:
        final book = settings.arguments as Order;
        return MaterialPageRoute(
          builder: (_) => OrderDetailsView(order: order),
        );
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}



