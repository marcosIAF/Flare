import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flare/consts.dart';
import 'package:flare/models/api_model.dart';
import 'package:flare/services/api_call.dart';
import 'package:flare/widgets/Search.dart';
import 'package:flare/widgets/most_anti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'About.dart';
import 'Home_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, viewModel, child) {
        APIResponse apiModel = viewModel.apiResponse;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Hero(
                        tag: 'MostTitle',
                        child: Text(
                          '🔥 Most Anticipated',
                          style: titlestyle,
//                          style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 25,
//                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/mostAnticipated');
                        },
                        child: Icon(
                          Icons.play_circle_outline,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
//            Consumer<HomeProvider>(
//              builder: (context, viewModel, child) {
//                return MostAnti(context, viewModel);
//              },
//            ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  width: double.infinity,
                  height: 300,
                  child: ListView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 250,
                          child: Card(
                            elevation: 5,
                            child: viewModel.isLoading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CachedNetworkImage(
                                    imageUrl: viewModel.apiModell.results[index]
                                        .backgroundImage,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
//                                : Image.network(
////                                'https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi',
//                                    viewModel.apiModell.results[index]
//                                        .backgroundImage,
//                                    fit: BoxFit.cover,
//                                  ),
                            //Icon(Icons.cloud_download, size: 50),
                          ),
                        );
                      }),
                ),
                Container(
                  color: Colors.redAccent,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: double.infinity,
                  height: 80,
                  child: Center(child: Text('Ad Unit')),
                ),
                RaisedButton(
                  child: Text('Click Me'),
                  onPressed: () {
                    //apiModel.fetchData();
                    print(viewModel.apiModell.count);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
