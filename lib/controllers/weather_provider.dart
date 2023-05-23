import 'package:flutter/material.dart';
import 'package:my_weather_app/services/api_call.dart';

import '../models/weather_model.dart';

class WeatherDataProvider extends ChangeNotifier{

 var cities = ['Delhi','Noida','Kolkata', 'Mumbai', 'New York', 'Patna'];
  bool _isLoading = false;
  bool get loading => _isLoading;
  final List<WetherCityModel> _wetherCityData = [];
  List<WetherCityModel> get wetherCityData => _wetherCityData;


  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  getData() async {
    setLoading(true);
    for (String city in cities) {
      await getWhetherByCity(city);
    }
    setLoading(false);
    notifyListeners();
  }

  getWhetherByCity(String city) async {
    var resp = await ApiCalls.getWhtherInfoByCity(city: city);
    WetherCityModel dataModel = WetherCityModel.fromJson(resp);
    if (dataModel.cod == "200") {
      _wetherCityData.add(dataModel);
    }
    notifyListeners();
  }
  // https://github.com/DeepakStark123/my_weather_app
 
}