// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/controllers/weather_provider.dart';
import 'package:my_weather_app/models/weather_model.dart';
import 'package:my_weather_app/views/weather_details.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WeatherDataProvider initproductProvider =
          Provider.of<WeatherDataProvider>(context, listen: false);
      initproductProvider.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var weatherdata = Provider.of<WeatherDataProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'today',
                      style: TextStyle(fontSize: 40),
                    ),
                    Icon(Icons.add)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: weatherdata.loading == true 
                  ? const Center(child: CircularProgressIndicator(),) 
                  : ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      itemCount: weatherdata.wetherCityData.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemBuilder: (context, index) {
                        WetherCityModel data =
                            weatherdata.wetherCityData[index];
                        var dt = DateTime.fromMicrosecondsSinceEpoch(
                            ((data.dt ?? 0) * 1000) * 1000,
                            isUtc: false);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           WeatherDetails(
                                            data:data,
                                          )));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.sys!.country ?? '',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black38),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        data.name ?? '',
                                        style: const TextStyle(
                                            fontSize: 22, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        DateFormat.jm().format(dt).toString(),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black38),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${((data.main!.temp ?? 0) - 273.15).toStringAsFixed(0)}°",
                                            style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Image.asset(
                                            data.weather![0].id! >= 200 &&
                                                    data.weather![0].id! < 300
                                                ? 'assets/images/sunlight.png'
                                                : data.weather![0].id! >= 300 &&
                                                        data.weather![0].id! <
                                                            400
                                                    ? 'assets/images/haze.png'
                                                    : data.weather![0].id! >=
                                                                500 &&
                                                            data.weather![0]
                                                                    .id! <
                                                                600
                                                        ? 'assets/images/rine.png'
                                                        : data.weather![0]
                                                                        .id! >=
                                                                    600 &&
                                                                data.weather![0]
                                                                        .id! <
                                                                    700
                                                            ? 'assets/images/snow.png'
                                                            : data.weather![0]
                                                                            .id! >=
                                                                        700 &&
                                                                    data.weather![0].id! <
                                                                        800
                                                                ? 'assets/images/rine.png'
                                                                : data.weather![0]
                                                                            .id! ==
                                                                        800
                                                                    ? 'assets/images/sunlight.png'
                                                                    : 'assets/images/clouds.png',
                                            height: 22,
                                            width: 22,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
