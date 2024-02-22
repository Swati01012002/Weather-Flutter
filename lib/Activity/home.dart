import 'dart:convert';

import 'package:flutter/material.dart';
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
    Map<dynamic, dynamic>? info;
   var routeSettings = ModalRoute.of(context)?.settings;
   if(routeSettings != null){
     info = routeSettings.arguments as Map<dynamic, dynamic>?;
   }
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Activity"),

      ),
      body:
          Column(
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {},
              ),
              Text(info?["main_value"])
            ],
          )

    );
  }
}


