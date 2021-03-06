import 'dart:io';

import 'package:flare/models/api_model.dart';
import 'package:flare/models/creator_model.dart';
import 'package:flare/models/publisher_model.dart';
import 'package:flare/services/api_call.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    getData();
  }
  APIModel apiModell;
  APIResponse apiResponse;
  CreatorModel creatorModel;
//  APIResponse apiResponse;
  bool isLoading = false;
  int page = 1;
  void getData() async {
    isLoading = true;
    notifyListeners();
    apiModell = await APIResponse().fetchData(page);
    print(apiModell);
//    nextPage = await apiModell.next;
//    tempList.addAll(apiModell.results);
//    res.addAll(tempList);
//    page++;
    await getPublishers();
    isLoading = false;
    notifyListeners();
  }

  void getPublishers() async {
    isLoading = true;
    notifyListeners();
    creatorModel = await APIResponse().fetchCreator(page);
    print(creatorModel);
//    nextPage = await apiModell.next;
//    tempList.addAll(apiModell.results);
//    res.addAll(tempList);
//    page++;
//    isLoading = false;
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
