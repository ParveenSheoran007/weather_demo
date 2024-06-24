import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:weather_demo/Screen/response/weatherResponse.dart';
import 'package:weather_demo/Service/weatherService.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherResponse? weatherResponse;
  bool loading  = false;
  String? longitude;
  String? latitude;
  bool error  = false;
  bool searchClick  = false;

  TextEditingController searchController = TextEditingController();

  Future fetchWeatherPro(BuildContext context,{required String? longitude,required String? latitude,required String? zipCode}) async {
    try{
      error = false;
      loading = true;
      weatherResponse = await WeatherApiService().fetchWeatherForecast(context,zipCode: zipCode,latitude: latitude,longitude: longitude);
      searchController.clear();
    }
    catch(e){
      if (kDebugMode) {
        print(e);
      }
      error = true;
    }loading = false;
    searchClick = false;
    notifyListeners();
  }




  static String kelvinToCelsius(double kelvin) {
    int temp = (kelvin - 273.15).toInt() ;
    return temp.toString();
  }

  static String windSpeed(double kelvin) {
    int speed = (kelvin * 3.6).toInt();
    return speed.toString();
  }

  static String convertTimeZoneToTime(int timeZone) {
    Duration offset = Duration(seconds: timeZone);
    DateTime currentTime = DateTime.now();
    DateTime timeInTimeZone = currentTime.add(offset);
    String formattedTime = DateFormat('HH:mm').format(timeInTimeZone);
    return formattedTime;
  }


   Future getCurrentLocation(BuildContext context,) async {
    final Location location = Location();
    LocationData _locationData;
      _locationData = await location.getLocation();
        longitude = _locationData.longitude.toString();
        latitude =  _locationData.latitude.toString();
    await fetchWeatherPro(context,longitude: longitude,latitude: latitude,zipCode: '');
   }


  searchBtnClick(){
    searchClick = true;
    notifyListeners();
  }

  static String getTimeFromDateTimeString(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
  static String getDateFromDateTimeString(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String date = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    return date;
  }

}