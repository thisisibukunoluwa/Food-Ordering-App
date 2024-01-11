import 'package:flutter/foundation.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';
import 'package:food_ordering_app/repositories/restaurant_repository.dart';

import '../models/api_response.dart';
import '../services/network/http_service.dart';
// add logging framework

class RestaurantViewModel extends ChangeNotifier {
  final _httpService = HttpService();

  ApiResponse _apiResponse = ApiResponse.initial('No data');

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> fetchRestaurants() async {
    _apiResponse = ApiResponse.loading('Fetching restaurant data');
    notifyListeners();
    try {
      List<RestaurantModel> list = await RestaurantsRepository(networkService: _httpService).getRestaurants();
      _apiResponse = ApiResponse.completed(list);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
