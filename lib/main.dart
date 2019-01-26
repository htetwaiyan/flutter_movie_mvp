import 'package:flutter/material.dart';
import 'package:flutter_movie_mvp/view/movie_list_page.dart';
import 'package:flutter_movie_mvp/view/test_page.dart';
import 'package:flutter/foundation.dart';


void main(){
  debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home:MovieListPage()
    )
  );
}