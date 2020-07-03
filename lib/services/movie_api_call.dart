import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flare/models/moviesModels/genre_resposne.dart';
import 'package:flare/models/moviesModels/genres_response.dart';
import 'package:flare/models/moviesModels/moveresponse.dart';
import 'package:flare/models/moviesModels/person_response.dart';
import 'package:flare/models/moviesModels/testing.dart';
import 'package:flare/models/moviesModels/testing1.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  final String APIKEY = "5bbc329a012275a9ae99315a158568d2";
  static String mainUrl = 'https://api.themoviedb.org/3';
  final Dio _dio = Dio();
  var getpopularURL = '$mainUrl/movie/top_rated';
  var getMoviesURL = '$mainUrl/discover/movie';
  var getPlayingURL = '$mainUrl/movie/now_playing';
  var getPersonURL = '$mainUrl/trending/person/week';
  var getGenresURL = '$mainUrl/genre/movie/list';
  MovieHomeResponse tt;
  GenresResponse ss;
  MovieByGenresResponse rr;
  Future<MovieHomeResponse> getMovie() async {
    var params = {
      'api_key': APIKEY,
      'language': 'en-US',
      'page': 1,
    };
    try {
      Response response =
          await _dio.get(getpopularURL, queryParameters: params);
      //var decodedbody = jsonDecode(response.body);
      tt = MovieHomeResponse.fromJson(response.data);
      return tt;
    } catch (error, stackTrace) {
      print('Exception Occured: $error stackTrace: $stackTrace');
      return MovieHomeResponse.withError(error);
    }
  }

  Future<GenresResponse> getGenres() async {
    var params = {
      'api_key': APIKEY,
      'language': 'en-US',
      'page': 1,
    };
    try {
      Response response = await _dio.get(getGenresURL, queryParameters: params);
      ss = GenresResponse.fromJson(response.data);
      return ss;
    } catch (error, stackTrace) {
      print('Exception Occured: $error stackTrace: $stackTrace');
    }
  }

  Future<MovieResponse> getPlayingmovies() async {
    var params = {
      'api_key': APIKEY,
      'language': 'en-US',
      'page': 1,
    };
    try {
      Response response =
          await _dio.get(getPlayingURL, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print('Exception Occured: $error stackTrace: $stackTrace');
      return MovieResponse.withError('$error');
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {
      'api_key': APIKEY,
    };
    try {
      Response response = await _dio.get(getPersonURL, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print('Exception Occured: $error stackTrace: $stackTrace');
      return PersonResponse.withError('$error');
    }
  }

  Future<MovieByGenresResponse> getMovieByGenre(int id) async {
    var params = {
      'api_key': APIKEY,
      'language': 'en-US',
      'page': 1,
      'with_genres': id,
    };
    try {
      Response response = await _dio.get(getMoviesURL, queryParameters: params);
      rr = MovieByGenresResponse.fromJson(response.data);
      return rr;
    } catch (error, stackTrace) {
      print('Exception Occured: $error stackTrace: $stackTrace');
    }
  }
}
