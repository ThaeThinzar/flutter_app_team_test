import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_team_test/common/common_utils.dart';
import 'package:flutter_app_team_test/sliver_test/sliver_app_bar_title_changer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SliverTestView extends StatefulWidget{
  _SliverTestViewState createState() => _SliverTestViewState();
}
class _SliverTestViewState extends State<SliverTestView>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black54,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading:  IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,),

              onPressed: (){
                Fluttertoast.showToast(msg: "Back Button to exit from app");
              },
            ),
            pinned: true,// to stable app bar after collapsed
            centerTitle: false,// to place app bar title center
            title:SliverAppBarTitleChanger(child: Text("Asian Travel")),
            backgroundColor: Colors.green,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/images/app_bar_img.jpg',
              fit: BoxFit.cover,),
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildListDelegate(
                [
                  for(int index = 0; index < famousCityList.length; index++)
                    sliverListItem(famousCityList[index].title, famousCityList[index].imageUrl,famousCityList[index].description),
                ]
              ),
              itemExtent: 150)
        ],
      )
    );
  }
  Widget sliverListItem(String title, String imgurl,String description){
    String imageUrl = 'assets/images/'+ imgurl;
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Card(
        color: Colors.grey[700],
        child: Container(
          margin: EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight:  Radius.circular(8.0),
                ),
                child: Image.asset(
                    imageUrl,
                    width: MediaQuery.of(context).size.width/3,
                    height: 120,
                    fit:BoxFit.fill
                ),
              ),
             Container(
               margin: EdgeInsets.only(left: 8),
               child:  Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 15,),
                   Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.amber),),
                   SizedBox(height: 5,),
                   Container(
                     width:175,
                     child: Text(description,
                       maxLines: 3,
                       overflow: TextOverflow.ellipsis,
                       softWrap: true,
                       style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),),
                   )
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}