import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main()async{
  final String apiKey = '5352e632cf9f09a11c469d39c87a2d83';
  final city = 'Jakarta';
  final String urlWeather = 'http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric';

  final response = await http.get(Uri.parse('$urlWeather$apiKey'));

  if (response.statusCode == 200) {
     final result = jsonDecode(response.body);
     final List listWeather = result['list']; 
     var currentDay = '';

     print('Weather Forecast:');

     for (final forecast in listWeather) {
   
      final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(forecast['dt'] * 1000);
       String formattedDate = DateFormat('E, d MMM y').format(dateTime);
      final String day = dateTime.day.toString();
      final int temperature = forecast['main']['temp'].round();
      double celcius = temperature - 273.15;

      

      if (day != currentDay) {
        print('$formattedDate: ${celcius.toStringAsFixed(2)} \u2103');
        currentDay = day;
      }
    }

 }
}
