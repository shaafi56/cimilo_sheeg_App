import 'package:cimilo_sheeg/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:cimilo_sheeg/home_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather/weather.dart';
import 'package:cimilo_sheeg/welcome view/welcomeView.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String cityName = '';
  Weather? weather;
  bool isLoading = false;

  Future<void> getWeather() async {
    //loadoing page
    setState(() => isLoading = !isLoading);
    //passed the fucntion lgetMyLocation

    //we create API key from OpenWeatherMap
    WeatherFactory openWeather =
        WeatherFactory('0714fa4f49712d63d755e8551819dfc6');

    //the create vatiable that shows the current location
    try {
      weather = await openWeather.currentWeatherByCityName(cityName);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("please correct City name"),
        duration: Duration(seconds: 7),
      ));
    }

    setState(() => isLoading = !isLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6eafab),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "S e a r ch",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: Colors.black26,
              onSubmitted: (value) {
                cityName = value;
                getWeather();
              },
              // onChanged: (value) {
              //   print(value);
              // },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: 'Name Country or city...'),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
              child: weather == null
                  ? Container()
                  : weatherView(
                      weather: weather!,
                    ))
        ]),
      ),
    );
  }
}
