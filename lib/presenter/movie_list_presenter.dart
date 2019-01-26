import 'dart:convert';

import 'package:flutter_movie_mvp/model/movie_response.dart';
import 'package:flutter_movie_mvp/utils/app_constants.dart';
import 'package:http/http.dart' as http;

abstract class MovieView{
  showData(List<Results> data);
  showError(String str);
  addData(List<Results> data);
  noLoadMore();
}


class MoviePresenter{

  MovieView mv;

  MoviePresenter(this.mv);


  getMovie(int pageNum)async{

    try{
    await http.get(BASEURL+pageNum.toString()).then((res){
      print(res.body);

      MovieResponse mr=MovieResponse.fromJson(json.decode(res.body));
      if(mr.results.length!=0) {
        if (pageNum == 1) {
          mv.showData(mr.results);
        } else {
          mv.addData(mr.results);
        }
      }else{
        mv.noLoadMore();
      }
    });
  }catch(e){
  print(e);
  }
  }



}