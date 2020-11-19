import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_team_test/common/common_widge.dart';
import 'package:flutter_app_team_test/common/constants.dart';
import 'package:flutter_app_team_test/plat_form_channel/plat_form_channel.dart';
import 'package:flutter_app_team_test/sliver_test/sliver_test_view.dart';

class BottomNavigationHome extends StatefulWidget{
  _BottomNavigationHomeState createState() => _BottomNavigationHomeState();
}
class _BottomNavigationHomeState extends State<BottomNavigationHome> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  List<Widget> _widgetOptions;
  @override
  void initState() {
    super.initState();
    _widgetOptions =  <Widget>[
      SliverTestView(),
      SliverTestView(),
      PlatformChannelView(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(title: Text('Sliver Home'),),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
           _widgetOptions[_page]
          ],
        ),

      ),
      bottomNavigationBar: CurvedNavigationBar(
        color:  Colors.amber,
        backgroundColor: Colors.black54,
        buttonBackgroundColor: Colors.white ,
        height: 50,
        key: _bottomNavigationKey,
        items: [
          Icon(Icons.table_rows,size: 20,color:Colors.black),
          Icon(Icons.account_balance_sharp,size: 20,color:Colors.black),
          Icon(Icons.table_view_outlined,size: 20,color:Colors.black)
        ],
        animationCurve:Curves.bounceInOut ,
        animationDuration: Duration(
          microseconds: 200
        ),
        onTap: (index){
          setState(() {
            _page = index;
          });

          debugPrint('current index is $index');
        },
      ),
    );
  }
}
