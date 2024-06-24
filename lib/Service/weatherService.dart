// weather_api_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_demo/Screen/response/weatherResponse.dart';
import 'package:weather_demo/apiEndPoint.dart';



class WeatherApiService {
  String url= ApiEndPoints.weatherUrl();

  Future<WeatherResponse?> fetchWeatherForecast(BuildContext context,{required String? zipCode,required String? longitude,required String? latitude}) async {
    try {
      String locationUrl = '${ApiEndPoints.baseUrl()}lat=${latitude ?? 28.6005683}&lon=${longitude ?? 75.6638717}&appid=${ApiEndPoints.appId()}';
      Uri uri = Uri.parse(zipCode =='' ? locationUrl : '${ApiEndPoints.baseUrl()}zip=${zipCode},IN&appid=${ApiEndPoints.appId()}');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        WeatherResponse weatherResponse = WeatherResponse.fromJson(jsonData);
        return weatherResponse;
      } else {
        throw Exception('Failed to fetch weather forecast: ${response.statusCode}');
      }
    }  on SocketException {
      showErrorDialog(context, 'Network Error', 'Please check your internet connection and try again.');
    }  catch (e) {
      if (kDebugMode) {
        print(e);
      }
      String errorMessage = e.toString();
      if (errorMessage.contains('Failed to fetch weather forecast: 404')) {
        showErrorDialog(context, 'Not Found', 'Weather data not found for the provided location.');
      } else {
        showErrorDialog(context, 'Error', 'An error occurred while fetching weather forecast: $errorMessage. Please try again later.');
      }
    }
  }
  void showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
