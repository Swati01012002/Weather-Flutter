import 'package:http/http.dart';
import 'dart:convert';

class worker {
  String location;
  worker({required this.location}) {
    location = this.location;
  }

  String temp = '';
  String humidity = '';
  String air_speed = '';
  String description = '';
  String main = '';

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=45a55afa069ac29a17258e937791e975"));
      Map data = jsonDecode(response.body);

      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      Map wind = data['wind'];
      double getAir_speed = wind["speed"] / 0.27777777777778;

      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];

      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc;
      main = getMain_des;
    } catch (e) {
      temp = "Enter correct city";
      humidity = "Enter correct city";
      air_speed = "Enter correct city";
      description = "Enter correct city";
      main = "Enter correct city";
    }
  }
}
