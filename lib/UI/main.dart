import 'package:flutter/material.dart';
import 'WheatherScreecClass.dart';
import 'package:wheather_app/logic/geolocation.dart';


void main() {
  runApp(const WheatherScreen());
  GeolocationAssistant.determinePosition();
}

