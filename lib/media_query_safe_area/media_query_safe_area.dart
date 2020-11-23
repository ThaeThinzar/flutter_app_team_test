import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestMediaSafeArea extends StatefulWidget{
_TestMediaSafeArea createState() => _TestMediaSafeArea();
}
class _TestMediaSafeArea extends State<TestMediaSafeArea>{
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    double screenSize= MediaQuery.of(context).size.shortestSide-55;

    EdgeInsets paddingSpace  = MediaQuery.of(context).viewPadding;

    return SafeArea(
      child:
      Scaffold(
        body: Center(
          child:
          //Column(
         /*   mainAxisAlignment: MainAxisAlignment.center,
            children:[
            Text("Hello, World!!\n"),
            Text("Screen Width : ${screenWidth.toString()}\n \nScreen Height:${screenHeight.toString()}")
            ]
          )*/
          Builder(builder: (context){
            if(orientation == Orientation.landscape){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: twoContainers(screenSize),
              );
            }
            else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: twoContainers(screenSize),
              );
            }
          },
          )
         /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth/2,
                height: screenWidth/2,
                color: Colors.green,
              ),
              Container(
                width: screenWidth/2 ,
                height:screenWidth/2,
                color: Colors.amber,
              )
            ],
          )*/
        ),
      ),
    );

  }
 List<Widget> twoContainers (double  size){
    return [
      Container(
        width:size ,
        height: size,
        color: Colors.red,
      ),
      Container(
        width: size,
        height: size,
        color: Colors.green,
      ),
    ];
 }
}