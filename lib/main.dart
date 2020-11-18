import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter_app_team_test/sliver_test/sliver_test_view.dart';

import 'package:flutter_app_team_test/common/common_widge.dart';
import 'package:flutter_app_team_test/plat_form_channel/plat_form_channel.dart';

import 'common/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final routes = <String,WidgetBuilder>{
    ScreenURLPath.PLATFORM_CHANNEL:(context) => PlatformChannelView() ,
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Activity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
      home: MyHomePage(title: 'Team OKR Test'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget buttonWidget(String title, String screenName, BuildContext context){
    return GestureDetector(
      onTap: (){
        CommonWidget.onPressedToNavigate(screenName,context);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightGreen,
              Colors.green[200],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(5, 5),
              blurRadius: 10,
            )
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(
            [
              buttonWidget('Platform channel',ScreenURLPath.PLATFORM_CHANNEL,context),
            ]
          ))
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
