import 'package:flutter/material.dart';
import 'package:my_weather_app/services/api_call.dart';

import '../models/weather_model.dart';

class WeatherDataProvider extends ChangeNotifier{

 var cities = ['Delhi','Noida','Mohali','Kolkata', 'Mumbai', 'New York', 'Patna'];
  bool _isLoading = false;
  bool get loading => _isLoading;
  final List<WetherCityModel> _wetherCityData = [];
  List<WetherCityModel> get wetherCityData => _wetherCityData;


  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  getData() async {
    for (String city in cities) {
      await getWhetherByCity(city);
    }
    notifyListeners();
  }

  getWhetherByCity(String city) async {
    setLoading(true);
    var resp = await ApiCalls.getWhtherInfoByCity(city: city);
    WetherCityModel dataModel = WetherCityModel.fromJson(resp);
    debugPrint(dataModel.visibility.toString());
    if (dataModel.cod == "200") {
      _wetherCityData.add(dataModel);
    }
    setLoading(false);
    notifyListeners();
  }
 
}