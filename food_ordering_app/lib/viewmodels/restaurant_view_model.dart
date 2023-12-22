import 'package:flutter/foundation.dart';
import 'package:food_ordering_app/features/restaurants/restaurants_view.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';
import 'package:food_ordering_app/repositories/restaurant_repository.dart';

import '../models/api_response.dart';
import '../services/network/http_service.dart';
// add logging framework

class RestaurantViewModel extends ChangeNotifier {
  final httpService = HttpService();

  ApiResponse _apiResponse = ApiResponse.loading('fetching restaurant data');

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> fetchRestaurants() async {
    try {
      List<RestaurantModel> list =
          await RestaurantsRepository(networkService: httpService)
              .getRestaurants();
      _apiResponse = ApiResponse.completed(list);
      print(list);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }
}
