import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flare/screens/MostAnticipatedProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flare/style/theme.dart' as Style;

class VideoWeb extends StatelessWidget {
  String getBannerAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    return null;
  }

  String tt;
  VideoWeb(this.tt);
  bool isLoader = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'View Clip',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
      ),
      backgroundColor: Style.Colors.mainColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: WebView(
                  initialUrl: tt,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: AdmobBanner(
                    adUnitId: getBannerAdUnitId(),
                    adSize: AdmobBannerSize.MEDIUM_RECTANGLE,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
