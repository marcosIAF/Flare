import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare/models/api_model.dart';
import 'package:flare/screens/Home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

class Testsy extends StatefulWidget {
  @override
  _TestsyState createState() => _TestsyState();
}

class _TestsyState extends State<Testsy> {
  ScrollController testy = ScrollController();
  APIModel apiModel;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, viewModel, child) {
        return LazyLoadScrollView(
          isLoading: viewModel.isLoading,
          onEndOfPage: () {
            viewModel.getData();
          },
          child: Scaffold(
            body: GridCustom(viewModel),
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
