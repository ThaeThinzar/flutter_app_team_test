import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_team_test/asian_city/bloc/bloc.dart';
import 'package:flutter_app_team_test/asian_city/model/get_city_res.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCityView extends StatefulWidget{
  _SearchCityViewState createState() => _SearchCityViewState();
}
class _SearchCityViewState extends State<SearchCityView>{
  final cityNameController = TextEditingController();
  City selectedCity;
  bool isShow;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isShow = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00001f),
      body: BlocListener<CityBloc,CityState>(
        cubit: CityBloc(),
        listener: (context,state){
          if(state is CityEventSuccess){
            if(state.searchedCity != null){
              setState(() {
                selectedCity = state.searchedCity;
                isShow = true;
              });
            }
          }
        },
        child: BlocBuilder<CityBloc,CityState>(
          cubit: CityBloc(),
          builder: (context,state){
            if(state is CityEventLoading){
              return Center(child: CircularProgressIndicator(),);
            } else {
             return  Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:34,left: 16, right: 16),
                          child: Text('Enter the location for which you want to search',
                            style: TextStyle(color: Colors.blue),),),
                        Padding(
                          padding: const EdgeInsets.only(top:8,left: 32, right: 32,bottom: 8),
                          child: Container(
                            child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: cityNameController,
                                keyboardType: TextInputType.text,
                                keyboardAppearance: Brightness.light,
                                enableSuggestions: true,
                                textInputAction: TextInputAction.search,
                                validator: (value) {
                                  if (value.isEmpty) return 'Enter City Name';
                                  return null;
                                },
                                decoration:
                                InputDecoration(
                                  labelText: 'Enter City Name',
                                  labelStyle: TextStyle(color: Colors.blue),
                                  focusColor: Colors.blueAccent[100],
                                  fillColor: Colors.blue,
                                  alignLabelWithHint: true,
                                  hintText: 'Eg. Yangon',
                                  hintStyle: TextStyle(color: Colors.white54),
                                  enabledBorder: new UnderlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.blue)
                                  ),
                                  prefixIcon: Icon(Icons.location_on,color: Colors.blue,),)),
                          ),
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            CityBloc().add(SearchCityEvent(cityName: cityNameController.text.toString()));
                          },
                          child: Text("Search"),
                        ),
                        isShow ?Container(
                          margin: EdgeInsets.all(16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              bottomRight:  Radius.circular(8.0),
                            ),
                            child: Image.asset(
                                'assets/images/bagan.jpg',
                                width: MediaQuery.of(context).size.width/2,
                                height: 150,
                                fit:BoxFit.fill
                            ),
                          ),
                        ): Container(),
                        isShow ? Container(
                          margin: EdgeInsets.all(16),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(8),
                                child: Text('Country ➤  Myanmar ',
                                  style: TextStyle(color: Colors.white, fontSize: 18),),
                              ),
                              Container(
                                margin: EdgeInsets.all(8),
                                child: Text('Region   ➤  Manadaly ',
                                  style: TextStyle(color: Colors.white, fontSize: 18),),
                              ),

                              Container(
                                margin: EdgeInsets.all(8),
                                child: Text('Famous ➤  Myanmar ',
                                  style: TextStyle(color: Colors.white, fontSize: 18),),
                              ),


                            ],
                          ) ,
                        ) :Container()
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      )

    );
  }
}