import 'package:flutter/material.dart';
import 'package:get/get.dart';

onError(dynamic error, dynamic controllerName) {
  if (error.response.statusCode == 404) {
    print(error.response);
    return error.response;
  } else if (error.response.statusCode == 403) {
    print(error.response);
    return error.response;
  } else if (error.response.statusCode == 409) {
    print(error.response);
    return error.response;
  } else if (error.response.statusCode == 500) {
    print(error.response);
    return Get.snackbar(controllerName, "Please Contact to IT Team",
        colorText: Colors.white, backgroundColor: Colors.red);
  } else if (error.response.statusCode == 400) {
    print(error.response);
    return error.response;
  } else if (error.response.statusCode == 422) {
    print(error.response);
    return error.response;
  } else if (error.response.statusCode == 401) {
    print(error.response);
    return error.response;
  } else if (error.response.statusCode == 433) {
    print(error.response);
    return error.response;
  } else {
    print("Exception ==> ${error.response}");
    return Get.snackbar(controllerName, "Please Contact to IT Team",
        colorText: Colors.white, backgroundColor: Colors.red);
  }
}
