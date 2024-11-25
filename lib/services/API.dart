

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class API {
  final dioClient = Dio();

  Future<Response> GetCountries({required String query}) async {
    try {
      debugPrint("GetCountries ==> https://restcountries.com/v3.1/name/$query");
      final response = await dioClient.get("https://restcountries.com/v3.1/name/$query");
      return response;
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }
}
