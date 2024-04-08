import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/weather_bloc.dart';
import 'package:flutter_weather/screens/widget/weather_icons.dart';
import 'package:flutter_weather/screens/widget/weather_widget.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff08244F), Color(0xff134CB5)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                BlocBuilder<WeatherBloc, WeatherBlocState>(
                  builder: (context, state) {
                    if (state is WeatherBlocSuccess) {
                      return SizedBox(
                        child: Column(
                          children: [
                            Text(
                              '${state.weather.areaName}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                            getWeatherIcon(state.weather.weatherConditionCode!),
                            Center(
                              child: Text(
                                '${state.weather.temperature!.celsius!.round()}°C',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 60),
                              ),
                            ),
                            Center(
                              child: Text(
                                state.weather.weatherMain!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                            Center(
                              child: Text(
                                DateFormat('EEEE dd *')
                                    .add_jm()
                                    .format(state.weather.date!),
                                //'April 8 | 12:58',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WeatherWidget(
                                  image: 'assets/images/sunrise.png',
                                  text: 'Sunrise',
                                  secondText: DateFormat()
                                      .add_jm()
                                      .format(state.weather.sunrise!),
                                ),
                                WeatherWidget(
                                  image: 'assets/images/sunset.png',
                                  text: 'Sunset',
                                  secondText: DateFormat()
                                      .add_jm()
                                      .format(state.weather.sunset!),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WeatherWidget(
                                  image: 'assets/images/temp_max.png',
                                  text: 'Temp Max',
                                  secondText:
                                      '${state.weather.tempMax!.celsius!.round()}°C',
                                ),
                                WeatherWidget(
                                  image: 'assets/images/temp_min.png',
                                  text: 'Temp Min',
                                  secondText:
                                      '${state.weather.tempMin!.celsius!.round()}°C',
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
