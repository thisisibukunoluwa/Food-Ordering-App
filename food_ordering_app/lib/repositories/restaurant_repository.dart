import 'package:food_ordering_app/models/restaurant_model.dart';
import 'package:food_ordering_app/services/base/api_data.dart';
import 'package:food_ordering_app/services/network/i_network_service.dart';

class RestaurantsRepository {
  RestaurantsRepository({required this.networkService});

  final INetworkService networkService;

  Future<List<RestaurantModel>> getRestaurants() async {
    final uri = APIData.fetchRestaurants();

    final response = await networkService.get(uri);

    return RestaurantResponse.fromMap(response).restaurants;
  }
}


