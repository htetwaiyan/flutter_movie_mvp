import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie_mvp/model/movie_response.dart';
import 'package:flutter_movie_mvp/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {

String url="https://api.themoviedb.org/3/movie/popular?api_key=f45b7e038139d8e9bb9f8878d46b6030&page=1";

Future<MovieResponse> getMovie()async{
  return await http.get(url).then((res){

    MovieResponse mr=MovieResponse.fromJson(json.decode(res.body));
      return mr;
  });
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
        centerTitle: true,
      ),
      body: FutureBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.data==null){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          MovieResponse mr=snapshot.data;
          return ListView(
            children: mr.results.map((m){
              return Card(
                child: Column(
                  children: <Widget>[
                CachedNetworkImage(
                imageUrl: IMG_LINK+m.backdropPath,
                  placeholder: new CircularProgressIndicator(),
                  errorWidget: new Icon(Icons.error),
                ),
                    Text(m.title),
                  ],
                ),
              );
            }).toList(),
          );
        }

      },
      future: getMovie(),),
    );
  }




}
