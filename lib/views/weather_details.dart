import 'package:flutter/material.dart';
import 'package:my_weather_app/models/weather_model.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key, required this.data});
  final WetherCityModel data;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
            body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 214, 98, 15), Colors.white],
          stops: [0, 0.3],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)),
                  Row(
                    children: const [
                      Text(
                        "°C",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "°F",
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              data.weather![0].main ?? '',
              style: const TextStyle(color: Colors.black38),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: screenHeight * 0.2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${((data.main!.temp ?? 0) - 273.15).toStringAsFixed(0)}°",
                    style: TextStyle(
                        fontSize: screenHeight * 0.2,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Image.asset(
                      data.weather![0].id! >= 200 && data.weather![0].id! < 300
                          ? 'assets/images/sunlight.png'
                          : data.weather![0].id! >= 300 &&
                                  data.weather![0].id! < 400
                              ? 'assets/images/haze.png'
                              : data.weather![0].id! >= 500 &&
                                      data.weather![0].id! < 600
                                  ? 'assets/images/rine.png'
                                  : data.weather![0].id! >= 600 &&
                                          data.weather![0].id! < 700
                                      ? 'assets/images/snow.png'
                                      : data.weather![0].id! >= 700 &&
                                              data.weather![0].id! < 800
                                          ? 'assets/images/rine.png'
                                          : data.weather![0].id! == 800
                                              ? 'assets/images/sunlight.png'
                                              : 'assets/images/clouds.png',
                      height: 22,
                      width: 22,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 38.0, bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          (data.weather![0].description ?? '') != ''
                              ? data.weather![0].description!
                                      .substring(0, 1)
                                      .toUpperCase() +
                                  data.weather![0].description!.substring(
                                      1, data.weather![0].description!.length)
                              : '',
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Wrap(
                          children: [
                            const Text(
                              "feels like ",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              "${(data.main!.feelsLike ?? 0).toStringAsFixed(0)}°",
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          const Divider(),
          SizedBox(height: screenHeight * 0.04),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_upward_outlined,
                            ),
                            Text(
                              "${((data.main!.tempMax ?? 0) - 273.15).toStringAsFixed(0)}°",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        Row(
                          children: [
                            const Flexible(
                              flex: 1,
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Text("humidity")),
                            ),
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                      (data.main!.humidity ?? 0).toString())),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            const Flexible(
                              flex: 1,
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Text("uv index")),
                            ),
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Text('${data.clouds!.all ?? 0}')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.arrow_downward, size: 22),
                            Text(
                                "${((data.main!.tempMin ?? 0) - 273.15).toStringAsFixed(0)}°",
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        Row(
                          children: [
                            const Flexible(
                              flex: 1,
                              child: SizedBox(
                                  width: double.infinity, child: Text("wind")),
                            ),
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                  width: double.infinity,
                                  child:
                                      Text((data.wind!.speed ?? 0).toString())),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            const Flexible(
                              flex: 1,
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Text("pressure")),
                            ),
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                  width: double.infinity,
                                  child:
                                      Text('${data.main!.pressure ?? 0} mmHg')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          const Divider(),
          SizedBox(height: screenHeight * 0.04),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    child: Column(
                      children: const [
                        Text(
                          "now",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "16°",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    )));
  }
}
