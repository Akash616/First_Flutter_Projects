import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/consts/colors.dart';
import 'package:weather_application/consts/images.dart';
import 'package:weather_application/consts/strings.dart';
import 'package:weather_application/models/current_weather_model.dart';
import 'package:weather_application/models/hourly_weather_model.dart';
import 'package:weather_application/our_theme.dart';
import 'package:weather_application/services/api_services.dart';

import 'controllers/main_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //var date = DateTime.now(); //'package:intl/intl.dart' method DateFormat()
    var date = DateFormat("yMMMMd").format(DateTime.now());
    var theme = Theme.of(context); //app ka theme(custom theme banaya hai)

    var controller = Get.put(MainController());

    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: date.text.color(theme.primaryColor).make(),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            Obx(
              () => IconButton(
                  onPressed: () {
                    controller.changeTheme();
                  },
                  icon: Icon(
                    controller.isDark.value
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    color: theme.iconTheme.color,
                  )),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: theme.iconTheme.color,
                )),
          ], //two icons
        ),
        body: Obx( () => controller.isLoaded.value == true ?
            Container(
            padding: const EdgeInsets.all(5),
            child: FutureBuilder(
              //future: getCurrentWeather(),//problem ki har bar data ayaga toh har bar UI create hogi
              future: controller.currentWeatherData, //Har bar UI create nahi hogi
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  CurrentWeatherData data = snapshot.data as CurrentWeatherData;

                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          data.name.text.uppercase.bold
                              .fontFamily("poppins_bold")
                              .size(22)
                              .letterSpacing(3)
                              .color(theme.primaryColor)
                              .make(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/weather/${data.weather[0].icon}.png",
                                width: 80,
                                height: 80,
                              ),
                              RichText(
                                  text: TextSpan(
                                      //har chij ko alag say design kar sakta hai
                                      children: [
                                    TextSpan(
                                        text: "${data.main.temp}$degree",
                                        style: TextStyle(
                                            color: theme.primaryColor,
                                            fontSize: 55,
                                            fontFamily: "poppins")),
                                    TextSpan(
                                        text: " ${data.weather[0].main}",
                                        style: TextStyle(
                                            color: theme.primaryColor,
                                            letterSpacing: 3,
                                            fontSize: 14,
                                            fontFamily: "poppins"))
                                  ]))
                            ],
                          ),
                          Row(
                            //temperature kitna high ya low ja sakta hai
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton.icon(
                                onPressed: null,
                                icon: Icon(Icons.expand_less_rounded,
                                    color: theme.iconTheme.color),
                                label: "${data.main.tempMax}$degree"
                                    .text
                                    .color(theme.iconTheme.color)
                                    .make(),
                              ),
                              TextButton.icon(
                                onPressed: null,
                                icon: Icon(
                                  Icons.expand_more_rounded,
                                  color: theme.iconTheme.color,
                                ),
                                label: "${data.main.tempMin}$degree"
                                    .text
                                    .color(theme.iconTheme.color)
                                    .make(),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            //cloud % , wind speed and humidity
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(3, (index) {
                              var iconsList = [clouds, humidity, windspeed];
                              var values = [
                                "${data.clouds.all} %",
                                "${data.main.humidity} %",
                                "${data.wind.speed} km/h"
                              ];
                              return Column(
                                children: [
                                  Image.asset(
                                    iconsList[index],
                                    width: 60,
                                    height: 60,
                                  )
                                      .box
                                      .gray200
                                      .padding(EdgeInsets.all(8))
                                      .roundedSM
                                      .make(),
                                  10.heightBox, //SizedBox(height: 10,)
                                  values[index].text.gray400.make(),
                                ],
                              );
                            }),
                          ),
                          10.heightBox,
                          const Divider(),
                          10.heightBox,

                          //per time hour weather
                          FutureBuilder(
                            future: controller.hourlyWeatherData,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                HourlyWeatherData hourlyData =
                                    snapshot.data as HourlyWeatherData;

                                return SizedBox(
                                  height: 150,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: hourlyData.list.length > 6
                                        ? 6
                                        : hourlyData.list.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var time = DateFormat.jm().format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              hourlyData.list[index].dt.toInt() * 1000));

                                      return Container(
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.only(right: 4),
                                        decoration: BoxDecoration(
                                          color: cardColor,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            time.text
                                                .color(theme.primaryColor)
                                                .make(),
                                            Image.asset(
                                              "assets/weather/${hourlyData.list[index].weather[0].icon}.png",
                                              width: 80,
                                            ),
                                            "${hourlyData.list[index].main.temp}$degree"
                                                .text
                                                .black
                                                .color(theme.primaryColor)
                                                .make(),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),

                          10.heightBox,
                          const Divider(),

                          //next 7 days weather condition
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Next 7 Days"
                                  .text
                                  .semiBold
                                  .size(18)
                                  .color(theme.primaryColor)
                                  .make(),
                              TextButton(
                                  onPressed: () {},
                                  child: "View All".text.make()),
                            ],
                          ),
                          10.heightBox,
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            //now it scroll with main scroller
                            shrinkWrap: true,
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              var day = DateFormat("EEEE").format(DateTime.now()
                                  .add(Duration(
                                      days: index + 1))); //next day name is save
                              return Card(
                                color: theme.cardColor,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: day.text.semiBold
                                            .size(15)
                                            .color(theme.primaryColor)
                                            .make(),
                                      ),
                                      Expanded(
                                        child: TextButton.icon(
                                          onPressed: null,
                                          icon: Image.asset(
                                              "assets/icons/clouds.png",width: 50,height: 50,),
                                          label: "26$degree"
                                              .text
                                              .color(theme.primaryColor)
                                              .make(),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: "37$degree /",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: theme.primaryColor,
                                              fontFamily: "poppins",
                                            ),
                                          ),
                                          TextSpan(
                                              text: " 26$degree",
                                              style: TextStyle(
                                                  color: theme.primaryColor,
                                                  fontFamily: "poppins",
                                                  fontSize: 16)),
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
            : const Center(child: CircularProgressIndicator(),)
        ));
  }
}
