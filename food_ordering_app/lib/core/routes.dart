import 'package:flutter/material.dart';
import 'package:food_ordering_app/features/splash/splash_view.dart';

import '../features/bag/cart_view.dart';
import '../features/checkout/checkout_view.dart';
import '../features/confirmation/confirmation_view.dart';
import '../features/home/home_view.dart';
import '../features/orders/order_view.dart';
import '../features/profile/profile_view.dart';

class Routes {
  static const home = '/home';
  static const splash = '/splash';
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
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case confirmation:
        return MaterialPageRoute(builder: (_) => const ConfirmationView());
      case orders:
        return MaterialPageRoute(builder: (_) => const OrderView());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case checkout:
        return MaterialPageRoute(builder: (_) => const CheckoutView());
      case cart:
        return MaterialPageRoute(builder: (_) => const CartView());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      // case productDetails:
      //   final book = settings.arguments as Order;
      //   return MaterialPageRoute(
      //     builder: (_) => OrderDetailsView(order: order),
      //   );
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
