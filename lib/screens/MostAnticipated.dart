import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare/consts.dart';
import 'package:flare/models/api_model.dart';
import 'package:flare/screens/MostAnticipatedProvider.dart';
import 'package:flare/screens/game_details.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_refresh_indicator/lazy_load_refresh_indicator.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:flare/style/theme.dart' as Style;
import 'Home_provider.dart';

class MostAnticipated extends StatelessWidget {
  ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<MostProvider>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Style.Colors.mainColor,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Hero(
              tag: 'MostTitle',
              child: Text(
                '🔥 Most Anticipated',
                style: titlestyle,
//                style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 25,
//                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: LazyLoadRefreshIndicator(
            scrollOffset: 150,
            onRefresh: () async {
              viewModel.page = 1;
              viewModel.res.clear();
              viewModel.getData();
            },
            isLoading: viewModel.isLoading,
            onEndOfPage: () async {
              print('hello');

              viewModel.getData();
              print(viewModel.res.length);
            },
            child: SafeArea(
              child: Column(
                children: <Widget>[
//                  Container(
//                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                    child: Align(
//                      alignment: Alignment.topCenter,
//                      child: Hero(
//                        tag: 'MostTitle',
//                        child: Text(
//                          '🔥 Most Anticipated',
//                          style: titlestyle,
////                style: TextStyle(
////                    color: Colors.white,
////                    fontSize: 25,
////                    fontWeight: FontWeight.bold),
//                        ),
//                      ),
//                    ),
//                  ),
                  GridCustom(viewModel),
                  Visibility(
                      visible: viewModel.visiblee,
                      child: CircularProgressIndicator()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class GridCustom extends StatelessWidget {
  MostProvider viewModel;
  ScrollController scr;
  GridCustom(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: //viewModel.isLoading
          viewModel.res == null ||
                  viewModel.res.length == 0 ||
                  viewModel.res.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.amber),
                ))
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: viewModel.res.length,
                  itemBuilder: (context, index) {
//                viewModel.apiModell.results
//                    .map(
//                      (Results res) => GestureDetector(
//                      onTap: () {
//                        //TODO
//                      },
//                      child:
                    return Container(
                      margin: EdgeInsets.only(left: 3, right: 3),
                      height: 100,
                      width: 150,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GameDetails(index)));
                        },
                        child: Card(
                          elevation: 5,
                          child: Hero(
                            tag: viewModel.res[index].id,
                            child: CachedNetworkImage(
                              imageUrl: viewModel.res[index].backgroundImage,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
    );
//                  .toList();
  }
}

testt(MostProvider viewModel) async {
  await Future.delayed(Duration(seconds: 10));
  return CircularProgressIndicator();
}
