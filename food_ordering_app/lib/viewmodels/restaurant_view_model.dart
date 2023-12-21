import 'package:flutter/foundation.dart';
import 'package:food_ordering_app/repositories/restaurant_repository.dart';

import '../models/api_response.dart';
import '../services/network/http_service.dart';
// add logging framework 




class RestaurantViewModel extends ChangeNotifier {

  final httpService = HttpService();

  ApiResponse _apiResponse = ApiResponse.loading('');


  ApiResponse get response {
    return _apiResponse;
  }
  
  Future<void> fetchRestaurants(String value) async {
    try {

      var list = await RestaurantsRepository(networkService: httpService);
      _apiResponse = ApiResponse.completed(list);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }
}
