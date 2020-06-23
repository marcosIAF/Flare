import 'package:flare/screens/Home_provider.dart';
import 'package:flare/services/api_call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  APIResponse apiResponse = APIResponse();
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, viewModel, child) {
        return Container(
          child: Center(
            child: RaisedButton(
              child: Text('Click ME'),
              onPressed: () {
//                apiResponse.fetchData();
                viewModel.getData();
              },
            ),
          ),
        );
      },
    );
  }
}
