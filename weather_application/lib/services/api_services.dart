import 'package:http/http.dart' as http;
import 'package:weather_application/consts/strings.dart';
import 'package:weather_application/models/current_weather_model.dart';
import 'package:weather_application/models/hourly_weather_model.dart';

//var link = "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey";
//var link = "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";
//var hourlyLink = "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";

getCurrentWeather(lat,long) async{ //function
  var link = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var res = await http.get(Uri.parse(link));
  if(res.statusCode == 200){
    var data = currentWeatherDataFromJson(res.body.toString());
    print("Current Data is received");
    return data;
  }
}

getHourlyWeather(lat,long) async{ //function
  var hourlyLink = "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var res = await http.get(Uri.parse(hourlyLink));
  if(res.statusCode == 200){
    var data = hourlyWeatherDataFromJson(res.body.toString());
    print("Hourly Data is received");
    return data;
  }
}