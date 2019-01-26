import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie_mvp/model/movie_response.dart';
import 'package:flutter_movie_mvp/presenter/movie_list_presenter.dart';
import 'package:flutter_movie_mvp/utils/app_constants.dart';
import 'package:flutter_movie_mvp/widgets/movie_widget.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> with MovieView {


MoviePresenter presenter;


  List<Results> list=[];//0
int page=1;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    presenter=MoviePresenter(this);
    presenter.getMovie(1);
  }

var controller=RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
        centerTitle: true,
      ),
      body: SmartRefresher(
        controller: controller,
        child: ListView(
          children: list.map((m){
            return MovieWidget(m);
          }).toList(),
        ),
        onRefresh: (bool up){
          if(up){
            page=1;
            presenter.getMovie(page);
          }else{
            page++;
            presenter.getMovie(page);
          }
        },
        enablePullUp: true,
      ),

    )
    ;
  }


  @override
  showData(List<Results> data) {
    controller.sendBack(true, RefreshStatus.completed);
    setState((){
      this.list=data;
    });
  }

  @override
  showError(String str) {


  }

  @override
  addData(List<Results> data) {
    controller.sendBack(false,RefreshStatus.completed);
    controller.sendBack(false,RefreshStatus.canRefresh);
    setState((){
      this.list.addAll(data);
    });
  }

  @override
  noLoadMore() {
    controller.sendBack(false, RefreshStatus.noMore);
  }






}
