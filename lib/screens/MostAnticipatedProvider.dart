import 'package:flare/models/api_model.dart';
import 'package:flare/services/api_call.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MostProvider with ChangeNotifier {
  MostProvider() {
    getData();
  }

  APIModel mostapiModel;
  APIModel apinext;
  APIResponse apiResponse;
  List<Results> res = [];
  String nextPage;
  List<Results> tempList = [];
//  APIResponse apiResponse;
  bool isLoading = false;
  int page = 1;
  bool visiblee = false;
  void getData() async {
    isLoading = true;
    notifyListeners();
    mostapiModel = await APIResponse().fetchData(page);
    print(mostapiModel);
//    nextPage = await apiModell.next;
    res.addAll(mostapiModel.results);
    page++;
    isLoading = false;
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
