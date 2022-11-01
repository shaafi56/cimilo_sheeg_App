import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather/weather.dart';

import 'wigdet.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Future<void> getMyLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   print('altitude: ${position.altitude}, Longtitude: ${position.longitude}'); }

  Weather? weather;
  bool isLoading = false;

  //we create API key from OpenWeatherMap
  WeatherFactory openWeather =
      WeatherFactory('0714fa4f49712d63d755e8551819dfc6');

  //create function that will get the current location
  Future<Position> getMyLocation() async =>
      await Geolocator.getCurrentPosition();

  //create fucntion that wwill get the weather
  Future<void> getWeather() async {
    //loadoing page
    setState(() => isLoading = !isLoading);
    //passed the fucntion lgetMyLocation
    Position position = await getMyLocation();

    //the create vatiable that shows the current location
    weather = await openWeather.currentWeatherByLocation(
        position.latitude, position.longitude);

    setState(() => isLoading = !isLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () => getWeather(),
              icon: const Icon(Icons.pin_drop_outlined),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage())),
              icon: const Icon(Icons.search),
              iconSize: 30,
            ),
          ],
        ),
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const CachedNetworkImageProvider(
                        'https://w0.peakpx.com/wallpaper/250/538/HD-wallpaper-wallper-phone-planta-neon.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken))),
            child: weather == null
                ? const welcome_wigdet()
                : weatherView(
                    weather: weather!,
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                      backgroundColor: Colors.deepPurple,
                      title: const Text("Cimilo Sheeg App"),
                      content: const Text(
                          "Cimilo sheeg waa Application aad ku ogaan karto cimilda meel kasta oo aad joogtid"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Oky"))
                      ],
                    ));
          },
          child: const Icon(Icons.info),
        ));
  }
}
