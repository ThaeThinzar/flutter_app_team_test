import 'package:flutter/cupertino.dart';
import 'package:flutter_app_team_test/deeplink/DeepLinkBLOC.dart';
import 'package:provider/provider.dart';
class PocWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = Provider.of<DeepLinkBloc>(context);
    return StreamBuilder<String>(
      stream: _bloc.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
              child: Center(
                  child: Text('No deep link was used  ')));
        } else {
          return Container(
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Redirected: ${snapshot.data}'))));
        }
      },
    );
  }
}