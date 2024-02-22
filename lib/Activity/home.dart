import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.teal])),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.lightBlue[50],
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Icon(Icons.search),
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search $city",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.orange[50]),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      padding: EdgeInsets.all(26),
                      child: Row(
                        children: [
                          //Image.network("fhfb"),
                          Column(
                            children: [
                              Text("Scattered Clouds", style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold
                              ),),
                              Text("In Ahemdabad", style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold
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
                children: [
                  Expanded(
                    child: Container(
                      height: 210,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.orange[50]),
                      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(WeatherIcons.wi_thermometer),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("41", style: TextStyle(
                                fontSize: 80
                              ),),
                              Text("C", style: TextStyle(
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
                          color: Colors.orange[50]),
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start
                            ,
                            children: [
                              Icon(WeatherIcons.wi_day_windy),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("20.9",style: TextStyle(
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
                          color: Colors.orange[50]),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(26),
                      height: 200,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start
                            ,
                            children: [
                              Icon(WeatherIcons.wi_humidity),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("50.5",style: TextStyle(
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
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Made by Me",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
                    Text("Data Provided By Openweather.org",style: TextStyle(fontWeight: FontWeight.w400),),
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
