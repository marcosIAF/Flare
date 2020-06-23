import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare/consts.dart';
import 'package:flare/models/api_model.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

import 'Home_provider.dart';

class MostAnticipated extends StatelessWidget {
  ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: LazyLoadScrollView(
            onEndOfPage: () {
              print('hello');
              viewModel.getData();
              print(viewModel.res.length);
            },
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Hero(
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
                  ),
                  GridCustom(viewModel),
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
  HomeProvider viewModel;
  ScrollController scr;
  GridCustom(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: viewModel.res == null
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              controller: scr,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
                  child: Card(
                    elevation: 5,
                    child: CachedNetworkImage(
                      imageUrl: viewModel.res[index].backgroundImage,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                );
              }),
    );
//                  .toList();
  }
}
