import 'package:flutter/material.dart';
import 'package:weather/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{
  String temp = '';
  String hum = '';
  String air_speed = '';
  String des = '';
  String main = '';

  void startApp() async
  {
    worker instance = worker(location: "Mumbai");
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value" : air_speed,
        "des_value" : des,
        "main_value" : main
      } );
    });

  }
  @override
  void initState() {
    // TODO: implement initState
     startApp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 25,),
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
