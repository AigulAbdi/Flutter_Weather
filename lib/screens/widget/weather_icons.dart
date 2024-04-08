import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget getWeatherIcon(int code) {
  switch (code) {
    case >= 200 && < 300:
      return Lottie.asset('assets/lottie/thunder.json');
    case >= 300 && < 400:
      return Lottie.asset('assets/lottie/rain.json');
    case >= 500 && < 600:
      return Lottie.asset('assets/lottie/rainy.json');
    case >= 600 && < 700:
      return Lottie.asset('assets/lottie/snow.json');
    case >= 700 && < 800:
      return Lottie.asset('assets/lottie/foggy.json');
    case == 800:
      return Lottie.asset('assets/lottie/sunny.json');
    case > 800 && <= 804:
      return Lottie.asset('assets/lottie/cloud.json');
    default:
      return Lottie.asset('assets/lottie/cloud.json');
  }
}
