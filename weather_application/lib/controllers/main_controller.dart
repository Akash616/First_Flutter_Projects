import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_application/services/api_services.dart';

class MainController extends GetxController{

  @override
  void onInit() async{ ///getx method same as statefullwidget initstate method.
    super.onInit();
    await getUserLocation();
    currentWeatherData = getCurrentWeather(latitude.value,longitude.value);
    hourlyWeatherData = getHourlyWeather(latitude.value,longitude.value);
  }

  dynamic currentWeatherData;
  dynamic hourlyWeatherData;

  //user Location
  var latitude = 0.0.obs; //obs baad mai change karwana hai gtx
  var longitude = 0.0.obs; //obs means observable

  //for refresh automatically
  var isLoaded = false.obs;

  //changeTheme
  var isDark = false.obs; //obs baad mai change karwana hai getx

  changeTheme(){
    isDark.value = !isDark.value; //isDark.value = true
    Get.changeThemeMode(isDark.value ?  ThemeMode.dark : ThemeMode.light);
  }

  getUserLocation() async { //function
    bool isLocationEnabled; //check karaga location is enabled or not.
    LocationPermission userPermission; //if location enabled save the permission.

    //Geolocator.isLocationServiceEnabled() it check our loaction is enabled or not.
    isLocationEnabled = await Geolocator.isLocationServiceEnabled(); //await - response ana may time bhi lag sakta hai
    if(!isLocationEnabled){//!isLocationEnabled not enabled
      return Future.error("Location is not enabled"); //return message and function close
    }

    //otherwise - agar hamara location enable hai
    userPermission = await Geolocator.checkPermission(); //user say permission get karni hai
    if(userPermission == LocationPermission.deniedForever){//check karanga user na permission ko allow kiya hai ki nahi
      return Future.error("Permission is denied forever");
    }
    else if(userPermission == LocationPermission.denied){
      //Dubara say permission wala dialog show karwana hai
      userPermission = await Geolocator.requestPermission();
      if(userPermission == LocationPermission.denied){
        return Future.error("Permission is denied");
      }
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) {
      //current location - latitude & longitude
      //Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high) is say jo bhi response milaga woh sara
      //(value) may save ho jaya ga

      latitude.value = value.latitude;
      longitude.value = value.longitude;
      isLoaded.value = true;
    });//current location

  }

}