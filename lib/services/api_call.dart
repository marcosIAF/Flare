import 'dart:convert';

import 'package:flare/models/api_model.dart';
import 'package:http/http.dart' as http;

class APIResponse {
  APIModel apiModel;
  String APIUrl = 'https://rawg-video-games-database.p.rapidapi.com/games';
  Map<String, String> headers = {
    'x-rapidapi-key': '015509c39dmsh1f0facb3eaf3a48p18b66bjsne77a749e1ab7',
  };
  Future<APIModel> fetchData(int page) async {
    try {
      var response = await http.get('$APIUrl?page=$page', headers: headers);
//  print(response.body);
      var decodedbody = jsonDecode(response.body);
      apiModel = APIModel.fromJson(decodedbody);
      print(apiModel.results[1].backgroundImage);
      return apiModel;
    } catch (except) {
      print(except);
    }
  }

  Future<APIModel> fetchnextData(int page) async {
    try {
      var response = await http.get('$APIUrl?page=$page', headers: headers);
//  print(response.body);
      var decodedbody = jsonDecode(response.body);
      apiModel = APIModel.fromJson(decodedbody);
      print(apiModel.next);
      return apiModel;
    } catch (except) {
      print(except);
    }
  }
}
