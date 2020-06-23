import 'dart:io';

import 'package:flare/models/api_model.dart';
import 'package:flare/services/api_call.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    getData();
  }
  APIModel apiModell;
  APIModel apinext;
  APIResponse apiResponse;
  List<Results> res = [];
  String nextPage;
  List<Results> tempList = [];
//  APIResponse apiResponse;
  bool isLoading = false;
  int page = 1;
  void getData() async {
    isLoading = true;
    notifyListeners();
    apiModell = await APIResponse().fetchData(page);
    print(apiModell);
//    nextPage = await apiModell.next;
    tempList.addAll(apiModell.results);
    res.addAll(tempList);
    isLoading = false;
    notifyListeners();
    page++;
    notifyListeners();
  }

//  void getnextData() async {
//    isLoading = true;
//    notifyListeners();
//    apinext = await APIResponse().fetchnextData(page);
//    for (int i = 0; i < 20; i++) {
//      // res = apinext.results[i];
//      //apiModell.results.add(res);
//    }
//    print(apiModell);
//    isLoading = false;
//    page++;
//    notifyListeners();
//  }
}
