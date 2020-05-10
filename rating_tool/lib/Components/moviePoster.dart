import 'package:flutter/material.dart';
import 'package:rating_tool/Data_Classes/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MoviePoster extends StatelessWidget {
  final Movie movie;

  MoviePoster(this.movie);


  @override
  Widget build(BuildContext context) {
    //Base URL for Images TMDB:
    //https://image.tmdb.org/t/p/w342   + /xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg
    return Container(
        height: 513 / 2.5,
        width: 342 / 2.5,
        child: GestureDetector(
          child: movie.posterUrl != null
              ? Center(
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.black54),
                        strokeWidth: 4,
                        //backgroundColor: Color.fromRGBO(230,230,230,1),
                      ),
                  imageUrl: movie.posterUrl,
                ),
              )
              : Container(
                  color: Color.fromRGBO(45, 47, 49, 1),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(movie.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)))),
          onTap: () {
            Navigator.of(context).pushNamed("/details", arguments: movie);
          },
        ));
  }
}
