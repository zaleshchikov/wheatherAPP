import 'package:geolocator/geolocator.dart';
import '../model/wheatherModel.dart';
import 'api.dart';

class GeolocationAssistant {

  static Future<Position> determinePosition() async {


    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    var data = await (WeatherService.fetchCurrentWeather(lat: ( position.latitude).toString(), lon: position.longitude.toString()));
    print(data.iconCode);
    return await Geolocator.getCurrentPosition();
  }
}