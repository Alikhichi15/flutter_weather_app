import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_app/models/weather_locations.dart';
import 'package:flutter_weather_app/services/services.dart';

class BackendProvider with ChangeNotifier {
  bool _load = false;
  double tempr;
  String weatherCondition;
  double windSpedd;
  double clouds;
  double humidity;
  bool get load => _load;
  set load(bool data) {
    this._load = data;
    notifyListeners();
  }

  double get temp => tempr;
  set temp(double data) {
    this.tempr = data;
    notifyListeners();
  }

  double get windspeed => windSpedd;
  set windspeed(double data) {
    this.windSpedd = data;
    notifyListeners();
  }

  double get cloudss => clouds;
  set cloudss(double data) {
    this.clouds = data;
    notifyListeners();
  }

  double get humidityy => humidity;
  set humidityy(double data) {
    this.humidity = data;
    notifyListeners();
  }

  String get weatherConditions => weatherCondition;
  set weatherConditions(String data) {
    this.weatherCondition = data;
    notifyListeners();
  }

  getWeather(context) async {
    try {
      //load = true;
      var res = await WeatherService().getWeatherfromApi(context);
      WeatherModel weatherModel = WeatherModel.fromJson(res);
      temp = weatherModel.main.temp;
      //weatherConditions = weatherModel.weather[1].main;
      windspeed = weatherModel.wind.speed;
      cloudss = weatherModel.clouds.all.toDouble();
      humidityy = weatherModel.main.humidity.toDouble();
      load = false;
    } catch (e) {
      print(e);
    }
    load = false;
    notifyListeners();
  }
}
