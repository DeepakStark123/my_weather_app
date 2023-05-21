import 'package:flutter/material.dart';
import 'package:my_weather_app/controllers/weather_provider.dart';
import 'package:my_weather_app/views/home_screen,.dart';
import 'package:my_weather_app/views/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isOnBoardingRequired = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  isOnBoardingRequired = prefs.getBool("IsOnBoardingRequired") ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherDataProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: "Fira Sans",
              primarySwatch: Colors.blue,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 0),
              scaffoldBackgroundColor: Colors.white),
          home: isOnBoardingRequired
              ? const OnBoardingPage()
              : const HomeScreen()),
    );
  }
}
