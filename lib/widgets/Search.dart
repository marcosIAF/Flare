import 'package:flare/services/api_call.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  APIResponse apiResponse = APIResponse();
  bool vb = false;
  String text;
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.addListener(() {
      setState(() {});
    });
  }

  Widget testt() {
    if (textEditingController.text != null)
      return Icon(Icons.clear);
    else
      return null;
  }

  void show() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  child: Center(
                    child: Divider(
                      color: Colors.white,
                      height: 20,
                      thickness: 3,
                      indent: 70,
                      endIndent: 70,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: 70,
                  child: Card(
                    elevation: 10,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          textEditingController.text == ""
                              ? vb = false
                              : vb = true;
                        });
                        print(text);
                      },
                      controller: textEditingController,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25,
                        ),
                        suffixIcon: vb ? Icon(Icons.cancel) : null,
                        contentPadding: EdgeInsets.all(20),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Text(
                    'Popular',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  width: double.infinity,
                  height: 180,
                  child: ListView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 150,
                          child: Card(
                            elevation: 2,
                            child: Icon(Icons.cloud_download, size: 50),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: RaisedButton(
            child: Text('Click'),
            onPressed: () {
//              show();
//              apiResponse.fetchData();
            },
          ),
        ),
      ),
    );
  }
}

Widget fun() {
  return Center(
    child: Text('Hey'),
  );
}
