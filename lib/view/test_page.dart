import 'package:flutter/material.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  var rfController=RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: SmartRefresher(child: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("Hello")),
        );
      },
          itemCount: 20,
      ),
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: (b){
          if(b){
            print('up');
            rfController.sendBack(true, RefreshStatus.canRefresh);
          }else{
            print('down');
            rfController.sendBack(false,RefreshStatus.failed);
          }
        },
        controller: rfController,
      ),
    );
  }
}
