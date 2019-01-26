import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_mvp/model/movie_response.dart';
import 'package:flutter_movie_mvp/utils/app_constants.dart';

class MovieWidget extends StatelessWidget {

  Results results;
  MovieWidget(this.results);

  @override
  Widget build(BuildContext context) {



    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 16.0,right: 16.0,top: 10.0,bottom: 10.0),
        width: double.infinity,
        height:150.0,
        child: Row(
          children: <Widget>[
            Container(
              width: 100.0,
              height: 150.0,
              child: CachedNetworkImage(
                imageUrl: IMG_LINK+results.posterPath,
                errorWidget: Icon(Icons.error),
                placeholder: Icon(Icons.file_download),
              ),
            ),
            SizedBox(width: 16.0,),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(results.title,style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,

                  ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.0,),
                  Text(results.overview,overflow: TextOverflow.ellipsis,maxLines: 5,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7)
                  ),),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
