import 'package:flutter/material.dart';
import 'package:weather/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';


class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{
  String city = "Indore";
  String temp = '';
  String hum = '';
  String air_speed = '';
  String des = '';
  String main = '';
  String icon = '';

  void startApp(String city) async
  {
    worker instance = worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value" : air_speed,
        "des_value" : des,
        "main_value" : main,
        "icon_vale" : icon,
        "city_value": city,


      } );
    });

  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic>? search =
    ModalRoute.of(context)?.settings?.arguments as Map<dynamic, dynamic>?;
    if(search?.isNotEmpty ?? false)
      {
        city = search?['searchText'];
      }
    startApp(city);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 23,),
            Image.asset("images/61nuuPxUvaL.png", height: 130 , width: 130,),
            SizedBox(height: 15,),
            Text("Weather App", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 5,),
            Text("Made by Me", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              color: Colors.white70
            ),),
            SizedBox(height:20),
              SpinKitWave(
          color: Colors.black38,
          size: 50.0,
        ),
          ],
        ),
      ),
      backgroundColor: Colors.teal,
    );
  }
}
