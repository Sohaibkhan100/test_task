import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sentiment_analysis_evaluation/services/API.dart';

class SearchScreenController extends GetxController {
  var searchController;
  List<dynamic> suggestions = [];
  var Loading = false.obs;
  String error = '';
  Timer? debounce;

  @override
  void onInit() {
    searchController = TextEditingController();

    searchController.addListener(() {
      onSearchChanged(searchController.text);
    });

    super.onInit();
  }


  @override
  void dispose() {
    searchController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  Future<void> fetchCountries(String query) async {
    if (query.isEmpty) {
      suggestions = [];
      error = '';
      update();
      return;
    }

    Loading.value = true;
    error = '';
    update();

    try {
      final response = await API().GetCountries(query: query);
      print(response.data);

      if (response.statusCode == 200) {
        suggestions = response.data;
        if (suggestions.isEmpty) {
          error = 'No countries found.';
        }
        update();
      } else {
        error = 'No countries found.';
        suggestions = [];
        update();
      }
    } catch (e) {
      error = 'Unable to fetch data.';
      suggestions = [];
      update();
    } finally {
      Loading.value = false;
      update();
    }
  }

  // Debounce input
  void onSearchChanged(String query) {
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      fetchCountries(query);
    });
  }

}
