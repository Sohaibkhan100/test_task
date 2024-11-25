
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sentiment_analysis_evaluation/controller/SearchScreenController.dart';
import 'package:sentiment_analysis_evaluation/utils/ColorConstants.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void showCountryDetails(dynamic country) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,

        title: Center(child: Text(country['name']['common'], style: Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(
          color: Colors.white,
        )),)),
        content: Column(

          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(country['flags']['png']),
            const SizedBox(height: 16.0),
            Text('Population: ${country['population']}', style: Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(
              color: Colors.white,
            )),),
            Text('Region: ${country['region']}', style: Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(
              color: Colors.white,
            )),),
          ],
        ),

      ),
    );
  }





  @override
  Widget build(BuildContext context) {
    SearchScreenController searchScreenController = Get.put(SearchScreenController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Container(
          height: 35.h,
          width: 0.9.sw,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(5)),
          child: TextFormField(

            controller: searchScreenController.searchController,
            style: Theme.of(context).textTheme.bodySmall ?.merge(TextStyle(
                color: Colors.black,
             )),

            decoration: InputDecoration(
              hintText: "Search Here",
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.merge(TextStyle(fontSize: 11.sp, color: blackColor)),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 18.w, right: 10.w),
                child: Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                  size: 18.h,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
            ),
          ),
        ),
      ),
      body: GetBuilder(
        init: searchScreenController,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                if (searchScreenController.Loading.value)
                   SizedBox(
                      height: 0.6.sh

                      ,child: Center(child: CircularProgressIndicator(backgroundColor: Colors.black,)))
                else if (searchScreenController.error.isNotEmpty)
                  SizedBox(
          height: 0.6.sh
,
          child: Center(child: Text(searchScreenController.error, style: Theme.of(context).textTheme.bodySmall)))
                else
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context,index)=>Divider(),
                      addAutomaticKeepAlives: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: searchScreenController.suggestions.length,
                      itemBuilder: (context, index) {
                        final country = searchScreenController.suggestions[index];
                        return Center(
                          child: GestureDetector(
                            onTap: (){
                              showCountryDetails(country);
                            },
                            child: Container(
                              width: 0.9.sw,
                              height: 35.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 0.6.sw,
                                          child: Text(maxLines: 1,overflow: TextOverflow.ellipsis,country['name']['common'], style: Theme.of(context).textTheme.bodyMedium)),
                                      Text(country['region'], style: Theme.of(context).textTheme.bodySmall)
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                      height: 30.h,
                                      width: 30.h,
                                      child: Image.network(country['flags']['png']))
                                ],
                              ),
                            ),
                          ),
                        );

                      },
                    ),
                  ),
              ],
            ),
          );
        }
      ),
    );
  }

}
