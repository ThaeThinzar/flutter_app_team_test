import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_team_test/common/FamousCityData.dart';
import 'package:flutter_app_team_test/common/common_utils.dart';
import 'package:flutter_app_team_test/sliver_test/sliver_app_bar_title_changer.dart';

class SliverGridViewTest extends StatefulWidget{
  _SliverGridViewTestState createState() => _SliverGridViewTestState();
}
class _SliverGridViewTestState extends State<SliverGridViewTest>{
  List<FamousCityData> fcList = List();
  final _random = new Random();
  @override
  void initState() {
    super.initState();
    getList();
  }
  getList(){
    for(int i= 0; i<famousCityList.length;i++){
      fcList.add(famousCityList[i]);
    }

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading:  IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,),

              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            pinned: true,// to stable app bar after collapsed
            centerTitle: true,// to place app bar title center
           // title:SliverAppBarTitleChanger(child: Text("PhotoGallery")),
            backgroundColor: Colors.green,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title:Text('Photo Gallery', style: TextStyle(color: Colors.white, fontSize: 20),),
              background: Container(color: Colors.brown,)
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            ///no.of items in the horizontal axis
            crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,

            ),

          /* delegate: SliverChildListDelegate(//TODO sliverchildListdelegate
              [
                for(int i = 0; i< famousCityList.length;i++)

                  listItem(famousCityList[i]),
              ]
           )*/

           delegate: SliverChildBuilderDelegate(

               (BuildContext context,int index){
                return listItem(famousCityList[index]);
               },
               childCount: famousCityList.length,
           ),
          ),
        ],
      )
    );
  }
  Widget listItem(FamousCityData data){
    String imageUrl = 'assets/images/'+ data.imageUrl;
    return   Container(
      margin: EdgeInsets.all(8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
              bottomLeft: Radius.circular(4.0),
              bottomRight:  Radius.circular(4.0),
            ),
            child: Image.asset(
               imageUrl,
                width: MediaQuery.of(context).size.width/3,
                height: 120,
                fit:BoxFit.fill
            ),
          ),
          Positioned(
              left: 4,
              bottom: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title,style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.amber)),
                  Text(data.country,style: TextStyle(fontSize: 8, fontWeight: FontWeight.normal, color: Colors.white),)
                ],
              )
          )
        ],
      ),
    );
  }
  Widget gridItem(FamousCityData data) => Container(
    height: 100.0,
    color: Colors.amber,
    child: Center(
      child: Text(
        "${data.title}",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,),
      ),
    ),
  );
}