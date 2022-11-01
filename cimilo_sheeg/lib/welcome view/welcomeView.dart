import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:cimilo_sheeg/extensions/extension.dart';

class weatherView extends StatelessWidget {
  const weatherView({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 220,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    "https://cdni.iconscout.com/illustration/premium/thumb/unstable-weather-temperature-6217539-5106960.png"),
                fit: BoxFit.fill,
              )),
            ),
            RichText(
              text: TextSpan(
                  text: '${weather.areaName},${weather.country}',
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.5),
                  children: [
                    TextSpan(
                      text: '\nUpdated: ${weather.date!.format}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    TextSpan(
                      text:
                          '\n${weather.temperature!.celsius!.toStringAsFixed(1)}',
                      style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 1.5),
                    ),
                    // ignore: prefer_const_constructors
                    TextSpan(
                      text: 'ºC',
                      style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                          height: 1.5),
                    ),
                    TextSpan(
                      text: '\n${weather.weatherDescription}',
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
