import 'package:flare/models/creator_model.dart';
import 'package:flare/models/publisher_model.dart';
import 'package:flare/services/api_call.dart';
import 'package:flutter/foundation.dart';

class CreatorProvider with ChangeNotifier {
  CreatorProvider() {
    getData();
  }
  CreatorModel creatorModel;
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
    creatorModel = await APIResponse().fetchCreator(page);
    print(creatorModel);
//    nextPage = await apiModell.next;
    res.addAll(creatorModel.results);
    page++;
    isLoading = false;
    notifyListeners();
  }
}
