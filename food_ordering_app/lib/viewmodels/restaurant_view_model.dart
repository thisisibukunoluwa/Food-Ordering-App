import 'package:flutter/foundation.dart';
import 'package:food_ordering_app/features/restaurants/restaurants_view.dart';
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
    print("1 - i am loading");
    print(_apiResponse.data);
    try {
      // it hasn't reached here yet we still have an error outside here
      List<RestaurantModel> list =
          await RestaurantsRepository(networkService: _httpService)
              .getRestaurants();
      _apiResponse = ApiResponse.completed(list);
      print(" 2 - i have completed");
      print(_apiResponse.data);
      // print('${list} this is my list here');
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
      print("i have an error");
    }
    notifyListeners();
  }
}
