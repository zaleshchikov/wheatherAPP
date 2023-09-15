import 'dart:convert';
import 'package:wheather_app/model/wheatherModel.dart';
import 'package:http/http.dart' as http;


class WeatherService {
  static String _apiKey = "c25254a0ca221e83d54954a23d2d5657";

  static Future<Weather> fetchCurrentWeather( { String lat = "", String lon =""}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?&lat=$lat&lon=$lon&exclude=current&appid=$_apiKey&units=metric&lang=ru';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  static Future<List<Weather>> fetchHourlyWeather({String lat = "", String lon =""}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/forecast?q=Yekaterinburg&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
      final List<Weather> data = (jsonData['list'] as List<dynamic>)
          .map((item) {
        return Weather.fromJson(item);
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}