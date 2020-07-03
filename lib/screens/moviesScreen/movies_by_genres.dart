import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flare/models/moviesModels/testing1.dart';
import 'package:flare/screens/moviesScreen/Home_Provider.dart';
import 'package:flare/services/movie_api_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:flare/style/theme.dart' as Style;

class MovieTile extends StatefulWidget {
  int id;
  MovieTile(this.id);

  @override
  _MovieTileState createState() => _MovieTileState(id);
}

class _MovieTileState extends State<MovieTile> {
  int id;
  MovieByGenresResponse movieByGenresResponse;
  _MovieTileState(id);
  MovieHomeProvider ttt;
  MovieRepository ss;
  bool loadi = false;
  void calling() async {
    loadi = true;
    setState(() {});
    movieByGenresResponse = await MovieRepository().getMovieByGenre(id);
    setState(() {
      loadi = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calling();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieHomeProvider>(builder: (context, viewModel, child) {
      viewModel.getData1(id);
      return loadi
          ? Container(
              height: 270.0,
              padding: EdgeInsets.only(left: 10.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieByGenresResponse.results.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
                    child: GestureDetector(
//                onTap: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => MovieDetailScreen(movie: movies[index]),
//                    ),
//                  );
//                },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          viewModel.movieByGenresResponse.results[index]
                                      .posterPath ==
                                  null
                              ? Container(
                                  width: 120.0,
                                  height: 180.0,
                                  decoration: new BoxDecoration(
                                    color: Style.Colors.secondColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.0)),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        EvaIcons.filmOutline,
                                        color: Colors.white,
                                        size: 60.0,
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  width: 120.0,
                                  height: 180.0,
                                  decoration: new BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.0)),
                                    shape: BoxShape.rectangle,
                                    image: new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w200/" +
                                                viewModel
                                                    .movieByGenresResponse
                                                    .results[index]
                                                    .posterPath)),
                                  )),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 100,
                            child: Text(
                              viewModel
                                  .movieByGenresResponse.results[index].title,
                              maxLines: 2,
                              style: TextStyle(
                                  height: 1.4,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.0),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                viewModel.movieByGenresResponse.results[index]
                                    .voteAverage
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              RatingBar(
                                itemSize: 8.0,
                                initialRating: viewModel.movieByGenresResponse
                                        .results[index].voteAverage /
                                    2,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => Icon(
                                  EvaIcons.star,
                                  color: Style.Colors.secondColor,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : CircularProgressIndicator();
    });
  }
}
