import 'package:get/get.dart';
import 'package:sentiment_analysis_evaluation/view/SearchScreen.dart';
import 'package:sentiment_analysis_evaluation/view/SplashScreen.dart';


class AppRoutes {
  static String splash = "/";
  static String searchScreen = "/searchScreen";


  static List<GetPage<dynamic>> routes = [
    GetPage(
        name: searchScreen,
        page: () =>  SearchScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: splash,
        page: () =>  SplashScreen(),
        transition: Transition.fadeIn),


  ];
}
