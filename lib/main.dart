import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  String msg = "No message";
  static const channel = const MethodChannel('flutter_app_team_test/mychannel');
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  Future<Null> _openNewPage() async {
    final response =
    await channel.invokeMethod("openPage", ["Hello  From Flutter"]);
    print('Response of openPage: $response');
  }
  Future<Null> _showDialog() async {
    final response =
    await channel.invokeMethod("showDialog", ["Called From Flutter"]);
//    print(response);
    final snackbar = new SnackBar(content: new Text(response));
    Scaffold.of(context).showSnackBar(snackbar);
  }
  Future<void> getData()async{
    String message;
    try{
      message = await channel.invokeMethod('getData');
    }on PlatformException catch(e){
      message = "Failed to load message from native";
    }
    setState(() {
      msg = message;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              msg,
            ),
            RaisedButton(
              child: Text("Call Native Function"),
              onPressed: getData,
            ),
            SizedBox(height: 5,),
            RaisedButton(onPressed: _openNewPage,
            child: Text('Open New Page From Native'),),
            SizedBox(height: 5,),
            RaisedButton(onPressed: _showDialog,
              child: Text('Open Dialog'),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
