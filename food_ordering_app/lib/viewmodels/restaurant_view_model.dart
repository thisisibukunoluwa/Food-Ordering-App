import 'package:flutter/foundation.dart';
import 'package:food_ordering_app/repositories/restaurant_repository.dart';
// add logging framework 




class RestaurantViewModel extends ValueNotifier<List<CartProduct>>> {

  ApiResponse _apiResponse = ApiResponse.loading('');


  ApiResponse get response {
    return _apiResponse;
  }

  
  /// Call the media service and gets the data of requested media data of
  Future<void> fetchMediaData(String value) async {
    try {
      List<> mediaList = await RestaurantsRepository(networkService: networkService)
      _apiResponse = ApiResponse.completed(mediaList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }


}
