import 'package:flare/models/moviesModels/genre.dart';
import 'package:flare/models/moviesModels/genre_resposne.dart';
import 'package:flare/models/moviesModels/genres_response.dart';
import 'package:flare/models/moviesModels/moveresponse.dart';
import 'package:flare/models/moviesModels/testing.dart';
import 'package:flare/models/moviesModels/testing1.dart';
import 'package:flare/services/movie_api_call.dart';
import 'package:flare/screens/moviesScreen/movies_by_genres.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MovieHomeProvider with ChangeNotifier {
  MovieHomeProvider() {
    getData();
  }
  MovieHomeResponse movieResponse;
  GenresResponse genreResponse;
  MovieByGenresResponse movieByGenresResponse;
  List<int> ttt = [];
  bool isLoading = false;
  int page = 1;
  Genres id;
  void getData() async {
    isLoading = true;
    notifyListeners();
    movieResponse = await MovieRepository().getMovie();
    genreResponse = await MovieRepository().getGenres();
    print(movieResponse);
    for (int i = 0; i < genreResponse.genres.length; i++) {
      //await getData1();
    }
    //print(genreResponse.genres[0].name);
    // print(movieResponse.movies[0].title);
//    nextPage = await apiModell.next;
//    tempList.addAll(apiModell.results);
//    res.addAll(tempList);
//    page++;
    //  await getPublishers();
    isLoading = false;
    notifyListeners();
  }

  void getData1(int id) async {
    isLoading = true;
    notifyListeners();
    movieByGenresResponse = await MovieRepository().getMovieByGenre(id);

    //print(genreResponse.genres[0].name);
    // print(movieResponse.movies[0].title);
//    nextPage = await apiModell.next;
//    tempList.addAll(apiModell.results);
//    res.addAll(tempList);
//    page++;
    //  await getPublishers();
    isLoading = false;
    notifyListeners();
  }
}
