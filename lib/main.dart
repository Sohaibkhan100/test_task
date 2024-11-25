
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentiment_analysis_evaluation/Routes/Routes.dart';
import 'package:sentiment_analysis_evaluation/utils/ColorConstants.dart';


void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        // designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
      return GetMaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyLarge: GoogleFonts.satisfy(
              textStyle: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),

            bodySmall:  GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54),
            ),
            bodyMedium:  GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
          ),

        ),
      debugShowCheckedModeBanner: false,
      title: 'Country Search App',
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.splash,
      );});
  }
}
