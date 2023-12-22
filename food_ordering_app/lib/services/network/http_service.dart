import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_ordering_app/services/base/failure.dart';
import 'package:food_ordering_app/services/network/i_network_service.dart';

class HttpService implements INetworkService {
  @override
  Future<String> get(String uri) async {
    try {
      // to simulate network latency
      Future.delayed(const Duration(milliseconds: 300));
      final String response = await rootBundle.loadString(uri);
      var res = json.decode(response);
      print(res);
      return res;
    } on FormatException {
      throw Failure('Bad response format');
    } catch (ex) {
      throw Failure(ex.toString());
    }
  }
}
