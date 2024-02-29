import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    print("This is a init state");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget destroyed");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "Delhi", "Chennai", "Dhar", "Indore", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    Map<dynamic, dynamic>? info =
        ModalRoute.of(context)?.settings?.arguments as Map<dynamic, dynamic>?;

    String temp = ((info?['temp_value']).toString());
    String air = ((info?['air_speed_value']).toString());
    if (temp == "NA")
      {
        print("NA");
      }else
        {
          temp = ((info?['temp_value']).toString()).substring(0,4);
          air = ((info?['air_speed_value']).toString()).substring(0,4);
        }
    String icon = _extractIcon(info);
    String getcity = info?['city_value'];
    String hum = info?['hum_value'];
    String des = info?['des_value'];

    //print(icon);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.red[50],
        ),
      ),
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Colors.teal,
                    ])),
            child: Column(
              children: [
                Container(
                  //Search Wala Container
        
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ", "") == "")
                            {
                              print("Blank search");
                            }else
                              {
                                Navigator.pushNamed(context, "/loading", arguments:{
                                  "searchText" : searchController.text,});
                              }
                        },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Search $city"),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white.withOpacity(0.5)),
                              margin: EdgeInsets.symmetric(horizontal: 25,),
                              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                              child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                Image.network("https://openweathermap.org/img/wn/03n@2x.png"),
                                SizedBox(width: 50,),
                                Column(
                                    children: [
                                      Text("$des",style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),),
                                      Text("In $getcity",style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],
                                  ),
                  
                              ])),
                        ),
                      ],
                    ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 23),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.wi_thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$temp",style: TextStyle(
        
                                    fontSize: 80
                                ),),
                                Text("C",style: TextStyle(
                                    fontSize: 30
                                ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.wi_day_windy)
                              ],
                            ),
                            SizedBox(height: 30,)
                            ,
                            Text("$air",style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),),
                            Text("km/hr")
                          ],
                        ),
                        height: 200,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child:  Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.wi_humidity)
                              ],
                            ),
                            SizedBox(height: 30,)
                            ,
                            Text("$hum",style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),),
                            Text("%")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made By Me"),
                      Text("Data Provided By Openweathermap.org")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

    );

  }
  //String _extractTemperature(Map<dynamic, dynamic>? info) {
    //return info?['temp_value']?.toString()?.substring(0, 4) ?? '';
  //}

  String _extractIcon(Map<dynamic, dynamic>? info) {
    return info?['icon_value'] ?? '';
  }

}
