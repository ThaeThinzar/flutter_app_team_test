import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_team_test/common/common_utils.dart';
import 'package:flutter_app_team_test/sliver_test/sliver_app_bar_title_changer.dart';

class SliverGridViewTest extends StatefulWidget{
  _SliverGridViewTestState createState() => _SliverGridViewTestState();
}
class _SliverGridViewTestState extends State<SliverGridViewTest>{
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
            ),
           delegate: SliverChildListDelegate(
              [
                for(int i = 0; i< famousCityList.length;i++)

                  listItem(famousCityList[i].title, famousCityList[i].country, famousCityList[i].imageUrl),
              ]
           )
          ),
        ],
      )
    );
  }
  Widget listItem(String title, String country, String imgurl){
    String imageUrl = 'assets/images/'+ imgurl;
    return   Container(
      height: 400,
      width: 400,
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
                  Text(title,style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.amber)),
                  Text(country,style: TextStyle(fontSize: 8, fontWeight: FontWeight.normal, color: Colors.white),)
                ],
              )
          )
        ],
      ),
    );
  }

}