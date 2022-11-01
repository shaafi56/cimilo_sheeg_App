// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weather/weather.dart';

// class weatherApi extends StatefulWidget {
//   const weatherApi({super.key});

//   @override
//   State<weatherApi> createState() => _weatherApiState();
// }

// class _weatherApiState extends State<weatherApi> {
//   Weather? weather;

//   //create function that will get the current location
//   Future<Position> getMyLocation() async =>
//       await Geolocator.getCurrentPosition();

//   //create fucntion that wwill get the weather
//   Future<void> getWeather() async {
//     Position position = await getMyLocation();

//     //we create API key from OpenWeatherMap
//     WeatherFactory openWeather =
//         new WeatherFactory('0714fa4f49712d63d755e8551819dfc6');

//     //the create vatiable that shows the current location
//     weather = await openWeather.currentWeatherByLocation(
//         position.latitude, position.longitude);

//     print(weather.toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
