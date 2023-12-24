import 'package:flutter/foundation.dart';
import 'package:food_ordering_app/features/restaurants/restaurants_view.dart';
import 'package:food_ordering_app/models/restaurant_model.dart';
import 'package:food_ordering_app/repositories/restaurant_repository.dart';

import '../models/api_response.dart';
import '../services/network/http_service.dart';
// add logging framework

class RestaurantViewModel extends ChangeNotifier {

  final httpService = HttpService();

// right now, the api response is the issue , also we need to change the image objects to network images 

// from what i'm thinking, i think that it has to do with the listeners and state not changing tbh 

// that's why its stuck on the initial state - loading 

  ApiResponse _apiResponse = ApiResponse.loading('fetching restaurant data');

//so from the custom viewModel provider , we are accessing the response property through this response getter 

// we have to invoke fetch restaurants for the state to change, there is no place we are invoking it 

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> fetchRestaurants() async {
    try {
      // it hasn't reached here yet we still have an error outside here 
      List<RestaurantModel> list = await RestaurantsRepository(networkService: httpService).getRestaurants();
      
      _apiResponse = ApiResponse.completed(list);
      // print('${list} this is my list here');
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

}
