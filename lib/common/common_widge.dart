import 'package:flutter/material.dart';

class CommonWidget {
  static Widget buttonWidget(BuildContext context, String screenName,String buttonText){
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        color: Colors.green,
        focusColor: Colors.blueGrey,
        textColor: Colors.white,
        onPressed: (){
          onPressedToNavigate(screenName, context);
        },
        child: Text(buttonText),
      ),
    );
  }
  static void onPressedToNavigate(String screenName, BuildContext context){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushNamed(screenName);
    });
  }
  static void onReplacementScreen(String screenName, BuildContext context){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacementNamed(screenName);
    });
  }
}