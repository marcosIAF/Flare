import 'package:flare/screens/Home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MostAnti extends StatelessWidget {
  BuildContext contextt;
  HomeProvider viewModel;
  MostAnti(this.contextt, this.viewModel);
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (contextt, viewModel, child) {
//        ApiResponseModel api = viewModel.apiResponseModel;
        return Column(
          children: <Widget>[
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
                            : Image.network(
//                                'https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi',
                                viewModel
                                    .apiModell.results[index].backgroundImage,
                                fit: BoxFit.contain,
                              ),
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
                viewModel.getData();
                print(viewModel.apiModell.count);
              },
            ),
          ],
        );
      },
    );
  }
}
