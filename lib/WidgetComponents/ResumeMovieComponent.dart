import 'package:flutter/material.dart';

class ResumeMovieComponent extends StatelessWidget {
  const ResumeMovieComponent(this.movieName, this.movieImageUrl, {Key key})
      : super(key: key);
  final String movieName;
  final String movieImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 199,
        child: Card(
            elevation: 4.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 240,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(movieImageUrl))),
                  ),
                  Padding(
                      padding: EdgeInsets.all(1),
                      child: Text(
                        movieName,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ))
                ])));
  }
}
