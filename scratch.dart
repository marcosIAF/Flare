import 'dart:convert';

import 'package:flare/models/api_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

void main() async {
  HomeProvider h1 = await HomeProvider();
  await h1.getnextData();
}

class APIResponse {
  APIModel apiModel;
  String APIUrl = 'https://rawg-video-games-database.p.rapidapi.com/games';
  Map<String, String> headers = {
    'x-rapidapi-key': '015509c39dmsh1f0facb3eaf3a48p18b66bjsne77a749e1ab7',
  };
  Future<APIModel> fetchData() async {
    try {
      var response = await http.get(APIUrl, headers: headers);
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

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    getData();
  }

  APIModel apiModell;
  APIModel apinext;
  APIResponse apiResponse;
  List<Results> res;
//  APIResponse apiResponse;
  bool isLoading = false;
  int page = 2;
  void getData() async {
    isLoading = true;
    notifyListeners();
    apiModell = await APIResponse().fetchData();
    print('Initial Call');
    print(apiModell);
    print(apiModell.results.length);
    isLoading = false;
    notifyListeners();
  }

  void getnextData() async {
    isLoading = true;
    notifyListeners();
    apinext = await APIResponse().fetchnextData(page);
    print('Next Call');
    print(apiModell);
//    for (int i = 0; i < 20; i++) {
    res[1] = apinext.results[1];
    apiModell.results.add(res[1]);
//    }
    print(apiModell.results.length);
    isLoading = false;
    page++;
    notifyListeners();
  }
}
